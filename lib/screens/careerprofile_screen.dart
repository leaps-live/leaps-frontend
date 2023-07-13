import 'package:flutter/material.dart';

class CareerProfileScreen extends StatelessWidget {
  static const routeName = '/careerprofile';
  const CareerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Career Profile Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}
