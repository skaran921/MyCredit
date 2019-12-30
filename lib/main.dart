import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok_credit/utils/my_credit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config_page.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  MyCredit.prefs = await SharedPreferences.getInstance();
  runApp(MyCreditApp());
}

class MyCreditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConfigPage();
  }
}
