import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ok_credit/config/config_bloc.dart';
import 'package:ok_credit/config/config_event.dart';

class ScaffoldWithAppBar extends StatefulWidget {
  @override
  _ScaffoldWithAppBarState createState() => _ScaffoldWithAppBarState();
}

class _ScaffoldWithAppBarState extends State<ScaffoldWithAppBar> {
  Widget buildListTile(
      {@required String title, @required IconData leadingIcon}) {
    return ListTile(
      onTap: () {
        ConfigBloc().dispatch(SetDarkMode(!ConfigBloc().isDarkModeOn));
      },
      trailing: Icon(leadingIcon, color: Color(0xFF627386)),
      title: Text(
        "$title",
        style: TextStyle(fontSize: 18.0, color: Color(0xFF627386)),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
        child: CupertinoScrollbar(
      child: ListView(
        children: <Widget>[
          Container(
            // color: Colors.blue,
            width: double.infinity,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    radius: 40,
                    child: Text(
                      "KS",
                      style: TextStyle(fontSize: 25.0),
                    )),
                Text(
                  "Karan Soni",
                  style: TextStyle(color: Color(0xFF627386), fontSize: 22.0),
                )
              ],
            ),
          ),
          buildListTile(
              leadingIcon: FontAwesomeIcons.userCircle, title: "Profile"),
          Divider(),
          buildListTile(
              leadingIcon: FontAwesomeIcons.lightbulb, title: "Dark Mode"),
          Divider(),
          buildListTile(
              leadingIcon: FontAwesomeIcons.signOutAlt, title: "Logout"),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // margin: EdgeInsets.only(top: 6.0),
          child: FloatingSearchBar.builder(
            onChanged: (String value) {
              print("onChange: " + value);
            },
            onTap: () {
              print("onTap");
            },
            decoration: InputDecoration.collapsed(
              hintText: "Search",
            ),
            trailing: CircleAvatar(
              backgroundColor: Color(0xFF6253FD),
              foregroundColor: Colors.white,
              child: Text(
                "KS",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            drawer: buildDrawer(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "KS",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  radius: 30,
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                title: Text(
                  "Karan Soni",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text("9466067763",
                    style: TextStyle(fontSize: 16.0, color: Color(0xFFB1ADD4))),
                trailing: Column(
                  children: <Widget>[
                    Text(
                      "₹500",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red[300],
                          fontWeight: FontWeight.w600),
                    ),
                    Text("DUE",
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xFFB1ADD4)))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
