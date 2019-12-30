import 'package:flutter/material.dart';

class RoundedImageCenter extends StatelessWidget {
  final String imagePath;

  const RoundedImageCenter({Key key, @required this.imagePath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage("$imagePath"),
      ),
    );
  }
}
