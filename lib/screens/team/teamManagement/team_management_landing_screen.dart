import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:leaps_frontend/screens/creator/managegames_screen.dart';
import 'package:leaps_frontend/screens/creator/manageteams_screen.dart';
import 'package:leaps_frontend/screens/game/create_game_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createTeam_preFilters_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TeamManagementLandingScreen extends StatefulWidget {
  const TeamManagementLandingScreen({super.key});
  static const routeName = '/team_management_landing';

  @override
  State<TeamManagementLandingScreen> createState() =>
      _TeamManagementLandingScreenState();
}

class _TeamManagementLandingScreenState
    extends State<TeamManagementLandingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      // appBar: AppBar(
      //   backgroundColor: primaryBackgroundColor,
      //   title: const Text(
      //     'Solar Surfers',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   iconTheme: const IconThemeData(color: Colors.black),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      100), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        30), // Image radius
                                    child: Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Solar Surfers",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              235, 240, 251, 1),
                                          minimumSize: Size.zero, // Set this
                                          padding: EdgeInsets.zero, // and this
                                          fixedSize: const Size(53, 25),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: const Text('Edit',
                                            style: TextStyle(
                                                color: actionItem,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          const Text(
                            "University of Washington",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    color: primaryColor, width: 6, height: 6),
                              ),
                              const SizedBox(width: 7),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    color: tagColor, width: 6, height: 6),
                              ),
                              const SizedBox(width: 7),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    color: tagColor, width: 6, height: 6),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
