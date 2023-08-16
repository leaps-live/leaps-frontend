import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/creator/createcenter_screen.dart';
import 'package:leaps_frontend/screens/home/home_games.dart';
import 'package:leaps_frontend/screens/home/home_leagues.dart';
import 'package:leaps_frontend/screens/home/home_recommendations.dart';
import 'package:leaps_frontend/screens/home/notifications/notifications_screen.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              topBar(),
              SizedBox(
                height: 8,
              ),
              tabBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class topBar extends StatelessWidget {
  const topBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CreateCenterScreen.routeName);
          },
          child: const Row(
            children: [
              // Icon(Icons.add_circle_outline),
              Icon(
                Remix.dashboard_line,
                color: Color(0xFF2E3A59),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Create',
                style: TextStyle(
                    color: Color(0xFF2E3A59),
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
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
              width: 10,
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
      ],
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
    _tabController = TabController(length: 4, vsync: this);
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
        TabBar(
          isScrollable: true, // Make the TabBar scrollable
          controller: _tabController,
          tabs: const [
            Tab(text: "Recommendations"),
            Tab(text: "League"),
            Tab(text: "Game"),
            Tab(text: "Team"),
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
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
        SizedBox(
          height: 900, // Adjust the height as needed
          child: TabBarView(
            controller: _tabController,
            children: const [
              HomeRecommendations(),
              HomeLeagues(),
              HomeGames(),
              Text("gagag"),
            ],
          ),
        ),
      ],
    );
  }
}
