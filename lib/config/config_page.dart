import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ok_credit/config/config_bloc.dart';
import 'package:ok_credit/config/config_state.dart';
import 'package:ok_credit/login_page/create_account.dart';
import 'package:ok_credit/login_page/login_page.dart';
import 'package:ok_credit/login_page/login_screen.dart';
import 'package:ok_credit/utils/my_credit.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;
  // ***************************************initState**************************
  @override
  void initState() {
    super.initState();
    setUpApp();
  }
  // ***************************************initState**************************

  // **************************************setUpApp***************************
  Future setUpApp() async {
    configBloc = ConfigBloc();
    configBloc.isDarkModeOn =
        MyCredit.prefs.getBool(MyCredit.darkModePref) ?? false;
  }
  // **************************************setUpApp***************************

  // ***************************************dispose*******************************
  void dispose() {
    super.dispose();
  }

  // ***************************************dispose*******************************
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: "MyCredit",
            debugShowCheckedModeBanner: MyCredit.isDebugMode,
            theme: ThemeData(
                fontFamily: MyCredit.fontFamily,
                scaffoldBackgroundColor: ConfigBloc().isDarkModeOn
                    ? Color(0x121212)
                    : Color(0xFFFAFAFA),
                primaryColor: ConfigBloc().isDarkModeOn
                    ? Colors.black
                    : MyCredit.primaryAppColor,
                brightness: ConfigBloc().isDarkModeOn
                    ? Brightness.dark
                    : Brightness.light,
                textTheme: TextTheme(
                  title: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  subtitle: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  display1: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  display2: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  display3: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  display4: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  headline: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  subhead: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  caption: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  button: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  overline: TextStyle(
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  contentPadding: EdgeInsets.all(10.0),
                  focusColor: Color(0xFF6253FD),
                  fillColor: ConfigBloc().isDarkModeOn
                      ? Color(0xFF)
                      : Color(0xAAE1E1E9),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  labelStyle: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Colors.black),
                  hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: ConfigBloc().isDarkModeOn
                          ? Colors.white
                          : Color(0xDDB1ADD4)),
                ),
                cardColor:
                    ConfigBloc().isDarkModeOn ? Colors.black : Colors.white,
                buttonTheme: ButtonThemeData(
                    buttonColor:
                        ConfigBloc().isDarkModeOn ? Colors.black : Colors.white,
                    textTheme: ButtonTextTheme.primary),
                appBarTheme: AppBarTheme(elevation: MyCredit.appBarElevation)),
            home: LoginPage(),
            routes: {
              LoginPage.routeName: (context) => LoginPage(),
              CreateAccount.routeName: (context) => CreateAccount(),
              LoginScreen.routeName: (context) => LoginScreen(),
            },
          );
        },
      ),
    );
  }
}
