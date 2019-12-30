import 'package:flutter/material.dart';

//
// ******************************[CustomAlertBox]******************************
// [title] used for alert_box title by default its "Your alert title comes here"
// [icon] used for  alert_box title Icon by default its Info icon
// [messageText] used from main message of alert box by default its "Alert Message Here"
// [titleTextColor] used for  both title Text and Icon color by default its black
// [messageColor] used for main message text color by default its black
// [buttonColor] used for button background color by default its blue
// [buttonTextColor] used for button text color by default its white
// [buttonText] used for button text value by default its "Close"
// [sideBorderColor] used for side border color by default its light blue
//
class CustomAlertBox {
  final BuildContext context;
  final String title;
  final IconData icon;
  final String infoMessage;
  final Color titleTextColor;
  final Color messageTextColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color iconColor;
  final String buttonText;
  final Color sideBorderColor;
  CustomAlertBox({
    @required this.context,
    this.title,
    this.infoMessage,
    this.titleTextColor,
    this.messageTextColor,
    this.buttonColor,
    this.buttonText,
    this.buttonTextColor,
    this.icon,
    this.sideBorderColor,
    this.iconColor,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: Border(
                left: BorderSide(
                    width: 2, color: sideBorderColor ?? Color(0xFF3DC0F1))),
            title: Row(
              children: <Widget>[
                Icon(
                  icon ?? Icons.info,
                  color: iconColor ?? Color(0xFF3DC0F1),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Flexible(
                  child: Text(
                    title ?? "Your alert title",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: titleTextColor ?? Color(0xFF4E4E4E)),
                  ),
                )
              ],
            ),
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            children: <Widget>[
              Text(
                infoMessage ?? "Alert message here",
                style: TextStyle(color: messageTextColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    color: buttonColor ?? Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      buttonText ?? "Close",
                      style: TextStyle(color: buttonTextColor ?? Colors.white),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}

// ******************************[CustomAlertBox]******************************
//
