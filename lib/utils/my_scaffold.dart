import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  MyScaffold({Key key, @required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }
}
