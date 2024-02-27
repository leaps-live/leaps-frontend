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
    return const Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Welcome to leaps",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
