import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MyCredit {
  static const String appName = "MyCredit";
  static const String appVersion = "Version 1.0.0";
  static const int appVersionCode = 1;
  static const String fontFamily = "SourceSansPro-Regular";
  static bool isDebugMode = false;

  // *********************************appColors*******************
  static const Color primaryAppColor = Colors.indigo;
  static const Color secoudaryAppColor = Colors.black;

  // *************************IP Address ****************
  static const baseApiURL = "";

  // ************************Preferences**********************
  static SharedPreferences prefs;
  // *************************DarkModePrefs*********************
  static const String darkModePref = "darkModePref";

  // **************************userLoginIdPrefs*****************
  static const String userLoginIdPrefs = "userLoginIdPrefs";
  // *************************isLoginPrefs**************************
  static const String isLoginPrefs = "isLoginPrefs";

  // **************************appBar*******************************
  static const double appBarElevation = 0.0;
}
