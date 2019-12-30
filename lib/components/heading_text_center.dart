import 'package:flutter/material.dart';

class HeadingTextCenter extends StatelessWidget {
  final String label;

  const HeadingTextCenter({Key key, @required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$label",
        style: TextStyle(
            color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
