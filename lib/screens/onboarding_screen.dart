import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/userprofile_screen.dart';

import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to \nLeaps',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'User Profile',
                onTap: () {
                  Navigator.pushNamed(context, UserProfileScreen.routeName);
                },
              )),
        ],
      ),
    ));
  }
}
