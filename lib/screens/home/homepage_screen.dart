import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/creator/createcenter_screen.dart';
import 'package:leaps_frontend/screens/game/game_screen.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:leaps_frontend/screens/league/leaguePage/league_screen.dart';
import 'package:share_plus/share_plus.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<String> imageUrls = [
    "assets/images/swiper1.jpg",
    "assets/images/swiper2.jpeg",
    "assets/images/swiper3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CreateCenterScreen.routeName);
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
                          Navigator.pushNamed(
                              context, SearchMemberScreen.routeName);
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: const Icon(
                          Remix.notification_3_line,
                          color: Color(0xFF2E3A59),
                        ),
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
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                height: 200,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    //   return Image.network(
                    //     "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1629630.png",
                    //     fit: BoxFit.fill,
                    //   );
                    // },

                    return Image.asset(
                      imageUrls[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 3,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Color(0xFF7D7D7D),
                      activeColor: primaryColor,
                    ),
                  ),
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
                  Share.share("gagaga");
                },
                child: const Text("test Share"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
