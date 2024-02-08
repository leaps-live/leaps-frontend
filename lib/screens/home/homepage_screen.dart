import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leaps_frontend/screens/creator/creatorcenter_screen.dart';
import 'package:leaps_frontend/screens/home/home_games.dart';
import 'package:leaps_frontend/screens/home/home_video.dart';
import 'package:leaps_frontend/screens/home/home_team.dart';
import 'package:leaps_frontend/screens/home/notifications/notifications_screen.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/playground/s3_upload_test_screen.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:leaps_frontend/widgets/custom_button.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    if (userJsonString != null) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthRatio = MediaQuery.of(context).size.width;
    final heightRatio = MediaQuery.of(context).size.height;

    final pageHeadingStyle = TextStyle(
      fontSize: 0.04 * widthRatio,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
    );

    final labelStyle = TextStyle(
      fontSize: 0.035 * widthRatio,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            color: secondaryBackgroundColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  tabBar(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: !isLogin
          ? Container(
              width: double.infinity,
              height: 0.06 * heightRatio,
              color: secondaryText,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text(
                    "Sign up or Log in to explore more.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: const Size(90, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Sign up',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

class tabBar extends StatefulWidget {
  const tabBar({super.key});

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final widthRatio = MediaQuery.of(context).size.width;

    final widthRatio = MediaQuery.of(context).size.width;
    final heightRatio = MediaQuery.of(context).size.height;

    final pageHeadingStyle = TextStyle(
      fontSize: 0.04 * widthRatio,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
    );

    final labelStyle = TextStyle(
      fontSize: 0.035 * widthRatio,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
    );

    return Column(
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
                  Tab(text: "Teams"),
                  Tab(text: "Games"),
                  Tab(text: "Videos"),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: labelStyle,
                unselectedLabelStyle: labelStyle,
                indicator: const UnderlineTabIndicator(
                    borderRadius: BorderRadius.all(Radius.circular(300)),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2.5,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 17, vertical: 7)),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: const Icon(
                Remix.search_line,
                color: Color(0xFF2E3A59),
              ),
              onTap: () {
                Navigator.pushNamed(context, SearchMemberScreen.routeName);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              child: const Icon(
                Remix.notification_3_line,
                color: Color(0xFF2E3A59),
              ),
              onTap: () {
                Navigator.pushNamed(context, NotificationsScreen.routeName);
              },
            ),
          ],
        ),
        SizedBox(
          height: 900, // Adjust the height as needed
          child: TabBarView(
            controller: _tabController,
            children: const [
              HomeTeam(),
              HomeGames(),
              HomeVideo(),
            ],
          ),
        ),
      ],
    );
  }
}
