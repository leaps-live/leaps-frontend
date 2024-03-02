import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/teamProfile/team_profile_members_screen.dart';
import 'package:leaps_frontend/screens/team/teamProfile/team_profile_videos_screen.dart';
import 'package:leaps_frontend/screens/user/edit_profile_screen.dart';
import 'package:leaps_frontend/screens/settings/settings_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeamProfileScreen extends StatefulWidget {
  static const routeName = '/team_profile';
  const TeamProfileScreen({super.key});

  @override
  State<TeamProfileScreen> createState() => _TeamProfileScreenState();
}

late TabController _tabController;

class _TeamProfileScreenState extends State<TeamProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: primaryBackgroundColor,
            actions: [
              IconButton(
                icon: const Icon(
                  Remix.share_circle_line,
                  color: Color(0xFF2E3A59),
                ),
                onPressed: () {},
              ),
            ]),
        body: ListView(
          children: const [
            HeroContent(),
            SizedBox(height: 2),
            Highlight(),
          ],
        ));
  }
}

class HeroContent extends StatefulWidget {
  const HeroContent({super.key});

  @override
  State<HeroContent> createState() => _HeroContentState();
}

class _HeroContentState extends State<HeroContent> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
            child: Container(
          color: primaryBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(''),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Solar Surfers",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text("Follow",
                                      style: TextStyle(
                                        color: actionItem,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      )),
                                ),
                                const SizedBox(width: 9),
                                const Text("999k Views",
                                    style: TextStyle(
                                      color: secondaryText,
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 6)),
                      child: const Text('Join',
                          style: TextStyle(
                              fontSize: 15,
                              height: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  children: [
                    Text("Seattle, WA",
                        style: TextStyle(
                          color: secondaryText,
                        )),
                    SizedBox(width: 10),
                    Text("|", style: TextStyle(color: secondaryText)),
                    SizedBox(width: 10),
                    Text("Beginner", style: TextStyle(color: secondaryText)),
                    SizedBox(width: 10),
                    Text("|", style: TextStyle(color: secondaryText)),
                    SizedBox(width: 10),
                    Text("Male-only", style: TextStyle(color: secondaryText))
                  ],
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                          "“Some team description here. Please leave space.”",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class Highlight extends StatefulWidget {
  const Highlight({super.key});

  @override
  State<Highlight> createState() => _HighlightState();
}

class _HighlightState extends State<Highlight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true, // Make the TabBar scrollable
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(text: "Videos"),
                    Tab(text: "Members"),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  indicator: const UnderlineTabIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                      borderSide: BorderSide(
                        color: primaryColor,
                        width: 2,
                      ),
                      insets:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 5)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 900, // Adjust the height as needed
            child: TabBarView(
              controller: _tabController,
              children: const [TeamProfileVideos(), TeamProfileMembers()],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: For MVP2
class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Experience",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.black)),
          const SizedBox(height: 5),
          const Center(
              child: Text("Recent",
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 75,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                      width: 2.5,
                    ),
                    color: const Color(0xFFFEFEFE),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(100), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(23), // Image radius
                            child: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Point Guard',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Mighty Dragons',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ])),
            ],
          ),
          const SizedBox(height: 20),
          const Center(
              child: Text("2022",
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 75,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFEFE),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(100), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(23), // Image radius
                            child: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Point Guard',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Mighty Dragons',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ])),
            ],
          ),
        ],
      ),
    );
  }
}
