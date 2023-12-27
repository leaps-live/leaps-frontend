import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/career/careerprofile_teams.dart';
import 'package:leaps_frontend/screens/career/careerprofile_videos_screen.dart';
import 'package:leaps_frontend/screens/user/settings/settings_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CareerProfileScreen extends StatefulWidget {
  static const routeName = '/careerprofile';
  const CareerProfileScreen({super.key});

  @override
  State<CareerProfileScreen> createState() => _CareerProfileScreenState();
}

late User user;
late String userName;
late String userFirstName;
late String userLastName;
late TabController _tabController;

class User {
  String userid;
  String firstName;
  String lastName;
  String userType;
  String userName;

  User(
      {required this.userid,
      required this.firstName,
      required this.lastName,
      required this.userType,
      required this.userName});

  // Convert User object to Map
  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'userfirstname': firstName,
      'userlastname': lastName,
      'username': userName
    };
  }

  // Create User object from Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userid: json['userid'],
        firstName: json['userfirstname'],
        lastName: json['userlastname'],
        userType: json['usertype'],
        userName: json['username']);
  }
}

class _CareerProfileScreenState extends State<CareerProfileScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _getUserData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    if (userJsonString != null) {
      print("user data $userJsonString");
      user = User.fromJson(jsonDecode(userJsonString!));
      userName = user.userName;
      userFirstName = user.firstName;
      userLastName = user.lastName;
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text("@$userName",
                style: const TextStyle(
                  fontSize: 16,
                )),
            centerTitle: true,
            backgroundColor: primaryBackgroundColor,
            actions: [
              IconButton(
                icon: const Icon(
                  Remix.settings_line,
                  color: Color(0xFF2E3A59),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
              ),
            ]),
        body: isLogin
            ? ListView(
                children: const [
                  // SizedBox(height: 10),
                  HeroContent(),
                  SizedBox(height: 2),
                  Highlight(),
                  // ExperienceWidget()
                ],
              )
            : const Center(
                child: Text("Please login first"),
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
                      radius: 40,
                      backgroundImage: NetworkImage(''),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$userFirstName $userLastName",
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black)),
                        const SizedBox(height: 6),
                        const Row(
                          children: [
                            Text("999 Followers",
                                style: TextStyle(color: secondaryText)),
                            SizedBox(width: 9),
                            Text("999 Following",
                                style: TextStyle(color: secondaryText))
                          ],
                        )
                      ],
                    )
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
                    Text("Volleyball", style: TextStyle(color: secondaryText)),
                    SizedBox(width: 10),
                    Text("|", style: TextStyle(color: secondaryText)),
                    SizedBox(width: 10),
                    Text("Tennis", style: TextStyle(color: secondaryText))
                  ],
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text("“I am captivated by the world of pickle ball.”",
                        style: TextStyle(
                          fontSize: 16,
                        )),
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
                    Tab(text: "Teams"),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
              children: const [CareerVideos(), CareerTeams()],
            ),
          ),
        ],
      ),
    );
  }
}

// For MVP2
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
                  fontWeight: FontWeight.bold,
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
