import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/createcenter_screen.dart';
import 'package:leaps_frontend/screens/game_screen.dart';
import 'package:leaps_frontend/screens/searchMember_screen.dart';
import 'package:leaps_frontend/screens/team_screen.dart';

import 'league_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<void> testNode() async {
    // var url = Uri.parse('http://localhost:8080/routers/teams/test');
    var url = Uri.parse(
        'http://localhost:8080/users/b6031c9a-7409-4c7a-9ad4-13fd0f532619');
    var response = await http.get(url);
    // print(response);

    if (response.statusCode == 200) {
      // success
      var responseData = response.body;
      // process responseData
      print(responseData);
    } else {
      // fail
      print('fail request ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CreateCenterScreen.routeName);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.add_circle),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.search),
                      onTap: () {
                        Navigator.pushNamed(
                            context, SearchMemberScreen.routeName);
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      child: const Icon(Icons.notifications),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Recommendations",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LeagueScreen.routeName);
                  },
                  child: const Text("Leagues"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, GameScreen.routeName);
                  },
                  child: const Text("Games"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TeamScreen.routeName);
                  },
                  child: const Text("Teams"),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 230,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1629630.png",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
                // control: SwiperControl(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Live Games",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Popular Leagues",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Top Ranked Leagues",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                testNode();
              },
              child: const Text("test nodeJS"),
            ),
          ],
        ),
      ),
    );
  }
}
