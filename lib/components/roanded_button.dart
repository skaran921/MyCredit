import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final String title;
  final Function onPressed;
  final Color fontColor;

  const RoundedButton(
      {Key key,
      @required this.buttonColor,
      @required this.title,
      @required this.onPressed,
      this.fontColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "$title",
      onPressed: onPressed,
      backgroundColor: buttonColor,
      label: Text(
        "$title",
        style: TextStyle(
            color: fontColor ?? Colors.white, wordSpacing: 3.0, fontSize: 20.0),
      ),
      elevation: 1.0,
    );
  }
}
