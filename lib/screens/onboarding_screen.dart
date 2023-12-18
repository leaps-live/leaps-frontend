import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/game/editgame_screen.dart';
import 'package:leaps_frontend/screens/landing/landing_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/editleague_screen.dart';
import 'package:leaps_frontend/screens/league/leaguePage/league_screen.dart';
import 'package:leaps_frontend/screens/playground/s3_upload_test_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/editteam_screen.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_screen.dart';

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
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'Edit Team',
                onTap: () {
                  Navigator.pushNamed(context, EditTeamScreen.routeName);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'Edit League',
                onTap: () {
                  Navigator.pushNamed(context, EditLeagueScreen.routeName);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'Edit Game',
                onTap: () {
                  Navigator.pushNamed(context, EditGameScreen.routeName);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: 'S3 Upload Playground',
                onTap: () {
                  Navigator.pushNamed(context, S3UploadScreen.routeName);
                },
              )),
        ],
      ),
    ));
  }
}
