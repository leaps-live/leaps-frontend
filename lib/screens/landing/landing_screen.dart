import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';

import '../../utils/colors.dart';
import 'login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const routeName = '/landing';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            const Icon(
              Icons.face,
              size: 100,
            ),
            const SizedBox(
              height: 180,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                fixedSize: const Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Sign up'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: const Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: const Text(
                "Continue as a guest",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, MainScreen.routeName);
              },
            )
          ],
        ),
      ),
    ));
  }
}
