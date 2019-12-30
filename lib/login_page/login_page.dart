import 'package:flutter/material.dart';
import 'package:ok_credit/components/heading_text_center.dart';
import 'package:ok_credit/components/roanded_button.dart';
import 'package:ok_credit/components/rounded_image_center.dart';
import 'package:ok_credit/login_page/create_account.dart';
import 'package:ok_credit/login_page/login_screen.dart';

class LoginPage extends StatefulWidget {
  static final routeName = "/loginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RoundedImageCenter(
            imagePath: "assets/images/1.png",
          ),
          SizedBox(
            height: 20.0,
          ),
          HeadingTextCenter(
            label: "Let's get Started",
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundedButton(
            onPressed: () {
              Navigator.pushNamed(context, CreateAccount.routeName);
            },
            buttonColor: Color(0xFF6253FD),
            title: "Create Account",
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              buttonColor: Color(0xFFF0EEF8),
              fontColor: Colors.black,
              title: "      Login     ",
            ),
          )
        ],
      ),
    ));
  }
}
