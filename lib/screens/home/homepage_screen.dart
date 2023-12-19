import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/creator/createcenter_screen.dart';
import 'package:leaps_frontend/screens/home/home_games.dart';
import 'package:leaps_frontend/screens/home/home_leagues.dart';
import 'package:leaps_frontend/screens/home/home_recommendations.dart';
import 'package:leaps_frontend/screens/home/notifications/notifications_screen.dart';
import 'package:leaps_frontend/screens/playground/s3_upload_test_screen.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:leaps_frontend/widgets/custom_button.dart';
import 'package:remixicon/remixicon.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              tabBar(),
            ],
          ),
        ),
      ),
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
                labelStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 2,
                  ),
                ),
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
              HomeRecommendations(),
              HomeLeagues(),
              HomeGames(),
            ],
          ),
        ),
      ],
    );
  }
}
