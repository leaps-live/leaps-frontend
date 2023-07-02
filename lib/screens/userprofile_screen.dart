import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user';
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: backgroundColor,
            title: const Row(
                children: [Icon(Icons.menu, color: Colors.black, size: 30)])),
        body: const Text('This is User Profile Screeen'));
  }
}
