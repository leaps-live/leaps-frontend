import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
