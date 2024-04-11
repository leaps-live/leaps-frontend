import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  late String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      textAlign: TextAlign.left,
    );
  }
}
