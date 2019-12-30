import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ok_credit/components/custom_alert_box.dart';
import 'package:ok_credit/components/heading_text_center.dart';
import 'package:ok_credit/components/roanded_button.dart';
import 'package:ok_credit/components/rounded_image_center.dart';

class CreateAccount extends StatefulWidget {
  static final routeName = "/createAccount";

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // **************************************textFieldController****************************
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // **************************************textFieldController****************************

  // *************************************ValidateInfo************************************
  validateInfo() {
    if (firstNameController.text.length <= 2) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "First name is empty, Please enter a value.");
    } else if (lastNameController.text.length <= 2) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Last name is empty, Please enter a value.");
    } else if (mobileNumberController.text.length <= 2) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Mobile Number is empty, Please enter a value.");
    } else if (emailController.text.length <= 2) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Email is empty, Please enter a value.");
    } else if (passwordController.text.length <= 2) {
      DangerAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Password is empty, Please enter a value.");
    } else if (firstNameController.text.contains(" ")) {
      WarningAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Invalid first name, Check the value and try again.");
    } else if (lastNameController.text.contains(" ")) {
      WarningAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Invalid last name, Check the value and try again.");
    } else if (mobileNumberController.text.length != 10) {
      WarningAlertBox(
          context: context,
          title: "Oops!",
          messageText:
              "Invalid mobile number, Check the number and try again.");
    } else if (!emailController.text.contains("@") ||
        !emailController.text.contains(".")) {
      WarningAlertBox(
          context: context,
          title: "Oops!",
          messageText: "Invalid email address, Check the email and try again.");
    } else {
      // ***********************************Create Account************************
      CustomAlertBox(
          context: context,
          title: "Well Done!",
          infoMessage: "Account created successfully.",
          sideBorderColor: Color(0xFF6253FD),
          buttonColor: Color(0xFF6253FD),
          iconColor: Color(0xFF6253FD),
          icon: FontAwesomeIcons.checkCircle);
    }
  }

  // *************************************ValidateInfo************************************
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  RoundedImageCenter(
                    imagePath: "assets/images/4.png",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  HeadingTextCenter(
                    label: "Registration",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      "Enter your mobile number or some other basic information",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xDDB1ADD4),
                          wordSpacing: 1),
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
                          decoration: InputDecoration(hintText: "First Name"),
                          controller: firstNameController,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: "Last Name"),
                          controller: lastNameController,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        TextField(
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration:
                              InputDecoration(hintText: "Mobile Number"),
                          controller: mobileNumberController,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: "Email"),
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        RoundedButton(
                          onPressed: () {
                            validateInfo();
                          },
                          title: "Create Account",
                          buttonColor: Color(0xFF6253FD),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
