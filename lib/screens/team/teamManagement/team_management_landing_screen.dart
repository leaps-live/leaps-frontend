import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:leaps_frontend/screens/creator/managegames_screen.dart';
import 'package:leaps_frontend/screens/creator/manageteams_screen.dart';
import 'package:leaps_frontend/screens/game/create_game_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createTeam_preFilters_screen.dart';
import 'package:leaps_frontend/screens/team/join_team_screen.dart';
import 'package:leaps_frontend/screens/team/teamManagement/announcements/announcements_history_screen.dart';
import 'package:leaps_frontend/screens/team/teamManagement/announcements/write_announcement_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 14),
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
                                GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
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
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            "University of Washington",
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
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
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: grayShadeColor,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                      child: const Row(
                        children: [
                          Icon(Remix.user_shared_line,
                              color: iconColor, size: 20),
                          SizedBox(width: 8),
                          Text('Invite',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, WriteAnnouncementScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: grayShadeColor,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                      child: const Row(
                        children: [
                          Icon(Remix.edit_line, color: iconColor, size: 20),
                          SizedBox(width: 8),
                          Text('Post',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: grayShadeColor,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                      child: const Row(
                        children: [
                          Icon(Remix.message_line, color: iconColor, size: 20),
                          SizedBox(width: 8),
                          Text('Chat',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: basketball, width: 1.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          13), // Image radius
                                      child: Image.network(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Jack Stanley',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text(
                                    'Coach',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: secondaryTextColor),
                                  )
                                ],
                              ),
                              const Icon(
                                Remix.pushpin_line,
                                color: basketball,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          const Text(
                            "Hey everyone, don’t forget we have practice before the game on Monday night.",
                            style: TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "More Announcements",
                            style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(width: 5),
                          Icon(Remix.arrow_right_line,
                              color: secondaryText, size: 15),
                        ]),
                    onTap: () {
                      Navigator.pushNamed(
                          context, AnnouncementsHistoryScreen.routeName);
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.black26,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: basketball,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Remix.basketball_fill,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Tuesday, March 5",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Remix.arrow_right_s_line,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      100), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        15), // Image radius
                                    child: Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Mighty Dragons',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                )
                              ]),
                              const SizedBox(height: 15),
                              Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      100), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        15), // Image radius
                                    child: Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Mighty Dragons',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                )
                              ])
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ]),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "More Games",
                            style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(width: 5),
                          Icon(Remix.arrow_right_line,
                              color: secondaryText, size: 15),
                        ]),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12)),
                  child: const Row(
                    children: [
                      Text('All Members (6)',
                          style: TextStyle(
                              fontSize: 16,
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(
                        Remix.arrow_right_s_line,
                        color: secondaryTextColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, JoinTeamScreen.routeName)},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12)),
                  child: const Row(
                    children: [
                      Text('Join Team',
                          style: TextStyle(
                              fontSize: 16,
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(
                        Remix.arrow_right_s_line,
                        color: secondaryTextColor,
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
