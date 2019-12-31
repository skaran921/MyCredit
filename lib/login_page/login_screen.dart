import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ok_credit/components/custom_alert_box.dart';
import 'package:ok_credit/components/heading_text_center.dart';
import 'package:ok_credit/components/roanded_button.dart';
import 'package:ok_credit/components/rounded_image_center.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:ok_credit/config/config_bloc.dart';
import 'package:ok_credit/config/config_event.dart';
import 'package:ok_credit/login_page/login_provider.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // **********************************TextFieldControllers***********************
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // **********************************TextFieldControllers***********************

  // **********************************Function checkMobileNumberValidity********************************
  validateInfo() {
    if (mobileNumberController.text.length == 0) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Mobile Number is empty, Please enter a value.");
    } else if (passwordController.text.length == 0) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Password is empty, Please enter a value.");
    } else if (mobileNumberController.text.length != 10) {
      WarningAlertBox(
          context: context,
          title: "Oops!",
          messageText:
              "Mobile Number is not valid, Please check the number and try again.");
    } else {
      //  ********************************Check Authentication *****************************
      LoginProvider()
          .checkLoginAuthentication(
              mobileNumber: mobileNumberController.text,
              password: passwordController.text)
          .then((value) {
        ConfigBloc().dispatch(SetLoadingEvent(true));
        if (value["result"] == "Invalid_User") {
          // ***************************************invalid info *************************
          DangerAlertBox(
              context: context,
              title: "Error",
              messageText:
                  "Login information is incorrect, Please enter valid data.");
        } else if (value["result"] == "Error") {
          // ***************************************Something Went Wrong *************************
          DangerAlertBox(
              context: context,
              title: "Error",
              messageText: "Oops. something went wrong.");
        } else if (value["result"] == "Network_Problem") {
          // **************************Network/OR Socket Problem**************************
          WarningAlertBox(
              context: context,
              title: "Network Problem",
              messageText: "Check your internet OR Wi-Fi connection.");
        } else {
          // ***********************************Account Created****************************
          // **************************Clear InputBox value***********************

          mobileNumberController.clear();
          passwordController.clear();
          // **************************Clear InputBox value***********************

          CustomAlertBox(
              context: context,
              title: "Well Done!",
              infoMessage: "Login successfully.",
              sideBorderColor: Color(0xFF6253FD),
              buttonColor: Color(0xFF6253FD),
              iconColor: Color(0xFF6253FD),
              icon: FontAwesomeIcons.checkCircle);
        }
        ConfigBloc().dispatch(SetLoadingEvent(false));
      });

      //  ********************************Check Authentication *****************************
    }
  }
  // **********************************Function checkMobileNumberValidity********************************

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            RoundedImageCenter(
              imagePath: "assets/images/7.png",
            ),
            SizedBox(
              height: 20.0,
            ),
            HeadingTextCenter(
              label: "Login",
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text(
                "Enter your mobile number and password",
                style: TextStyle(
                    fontSize: 16.0, color: Color(0xDDB1ADD4), wordSpacing: 1),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Form(
                child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    maxLength: 10,
                    controller: mobileNumberController,
                    decoration: InputDecoration(hintText: "Mobile Number"),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  ConfigBloc().isLoading
                      ? Container(
                          margin: EdgeInsets.only(bottom: 4.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        )
                      : Container(),
                  RoundedButton(
                    onPressed: () {
                      validateInfo();
                    },
                    title: "      Login     ",
                    buttonColor: Color(0xFF6253FD),
                  )
                ],
              ),
            ))
          ],
        )),
      ),
    );
  }
}
