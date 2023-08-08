import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/creator/createcenter_screen.dart';
import 'package:leaps_frontend/screens/home/homepage_screen.dart';
import 'package:leaps_frontend/screens/landing/landing_screen.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/league/leaguePage/league_screen.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_screen.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';
import 'package:leaps_frontend/screens/user/userprofile_screen.dart';

import '../widgets/custom_button.dart';
import 'landing/login_screen.dart';

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
                text: 'Landing',
                onTap: () {
                  Navigator.pushNamed(context, LandingScreen.routeName);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'TeamPage',
                onTap: () {
                  Navigator.pushNamed(context, TeamScreen.routeName);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'LeaguePage',
                onTap: () {
                  Navigator.pushNamed(context, LeagueScreen.routeName);
                },
              )),
        ],
      ),
    ));
  }
}
