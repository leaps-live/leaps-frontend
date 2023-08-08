import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/livestream/createlivestream_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createteam_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/createLeague_screen.dart';
import 'package:leaps_frontend/screens/game/creategame_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/editleague_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/editteam_screen.dart';
import 'package:leaps_frontend/screens/game/editgame_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:remixicon/remixicon.dart';

class CreateCenterScreen extends StatefulWidget {
  const CreateCenterScreen({super.key});
  static const routeName = '/create_center';

  @override
  State<CreateCenterScreen> createState() => _CreateCenterScreenState();
}

class _CreateCenterScreenState extends State<CreateCenterScreen>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, MainScreen.routeName);
                },
                child: const Text(
                  "GO HOME",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Creator Center",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateTeamScreen.routeName);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Remix.team_line,
                            color: Color(0xFF2E3A59),
                          ), // 添加图标
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Create a team",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateLeagueScreen.routeName);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Remix.medal_line,
                            color: Color(0xFF2E3A59),
                          ), // 添
                          SizedBox(width: 8),
                          Text(
                            "Create a league",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateGameScreen.routeName);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Remix.basketball_line,
                            color: Color(0xFF2E3A59),
                          ), // 添 // 添加图标
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Create a game",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateLiveStreamScreen.routeName);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Remix.broadcast_line,
                            color: Color(0xFF2E3A59),
                          ), // 添
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Live streaming",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                "Manage",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: "Team"),
                      Tab(text: "League"),
                      Tab(text: "Game"),
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
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                  ),
                  SizedBox(
                    height: 200, // Adjust the height as needed
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditTeamScreen.routeName);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.abc,
                                size: 50,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    "Los Angeles Lakers",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditLeagueScreen.routeName);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.abc,
                                size: 50,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    "NCAA",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditGameScreen.routeName);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.abc,
                                size: 50,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    "UWJE vs UCLA",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
