import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:leaps_frontend/screens/creator/managegames_screen.dart';
import 'package:leaps_frontend/screens/creator/manageteams_screen.dart';
import 'package:leaps_frontend/screens/game/create_game_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createTeam_preFilters_screen.dart';
import 'package:leaps_frontend/screens/team/teamManagement/announcements/write_announcement_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class JoinTeamScreen extends StatefulWidget {
  const JoinTeamScreen({super.key});
  static const routeName = '/join_team';

  @override
  State<JoinTeamScreen> createState() => _JoinTeamScreenState();
}

class _JoinTeamScreenState extends State<JoinTeamScreen>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Text(
                "Welcome to leaps",
                style: GoogleFonts.assistant(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1.0),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: const Column(
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Enter Team Code',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10)),
                child: Text('Join',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: const Text(
                  "Create your own team",
                  style: TextStyle(
                    color: actionItem,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, CreateTeamPreFiltersScreen.routeName);
                },
              ),
            )),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
