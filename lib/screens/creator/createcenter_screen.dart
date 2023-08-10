import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/livestream/createlivestream_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createteam_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/createLeague_screen.dart';
import 'package:leaps_frontend/screens/game/creategame_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/editleague_screen.dart';
import 'package:leaps_frontend/screens/game/editgame_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CreateCenterScreen extends StatefulWidget {
  const CreateCenterScreen({super.key});
  static const routeName = '/create_center';

  @override
  State<CreateCenterScreen> createState() => _CreateCenterScreenState();
}

class _CreateCenterScreenState extends State<CreateCenterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> searchResultTeam = [];
  List<dynamic> searchResultLeague = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAllTeams();
    getAllLeagues();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> getAllTeams() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    var apiUrl = Uri.parse('http://localhost:8080/team/getTeam/$userid');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        setState(() {
          searchResultTeam = json.decode(response.body);
        });
        print(searchResultTeam);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getAllLeagues() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    var apiUrl = Uri.parse('http://localhost:8080/leagues/getLeague/$userid');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        setState(() {
          searchResultLeague = json.decode(response.body);
        });
        print(searchResultLeague);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, MainScreen.routeName);
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
                      height: 400, // Adjust the height as needed
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Lists for Teams
                          isLoading
                              ? const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : searchResultTeam.isEmpty
                                  ? const Center(
                                      child: Text(
                                        "No teams found",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        for (var team in searchResultTeam)
                                          ListTile(
                                            title: Text(
                                              team['teamname'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 19),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                for (var category
                                                    in team['teamcategories'])
                                                  Text(
                                                    category,
                                                    style: const TextStyle(
                                                        fontSize: 17),
                                                  ),
                                              ],
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            leading: const CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://media.sproutsocial.com/uploads/2019/08/chicago-bulls-case-study-feature-img.png'),
                                            ),
                                            onTap: () {},
                                          )
                                      ],
                                    ),
                          // Lists for Leagues
                          const Center(
                            child: Text(
                              "No leagues found",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // isLoading
                          //     ? const SizedBox(
                          //         height: 200,
                          //         child: Center(
                          //           child: CircularProgressIndicator(
                          //             color: Colors.grey,
                          //           ),
                          //         ),
                          //       )
                          //     : searchResultLeague.isEmpty
                          //         ? const Center(
                          //             child: Text(
                          //               "No leagues found",
                          //               style: TextStyle(
                          //                   fontSize: 19,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           )
                          //         : Column(
                          //             children: [
                          //               for (var league in searchResultLeague)
                          //                 ListTile(
                          //                   title: Text(
                          //                     league['leaguename'],
                          //                     style: const TextStyle(
                          //                         color: Colors.black,
                          //                         fontSize: 19),
                          //                   ),
                          //                   subtitle: Row(
                          //                     children: [
                          //                       for (var category in league[
                          //                           'leaguecategories'])
                          //                         Text(
                          //                           category,
                          //                           style: const TextStyle(
                          //                               fontSize: 17),
                          //                         ),
                          //                     ],
                          //                   ),
                          //                   contentPadding:
                          //                       const EdgeInsets.symmetric(
                          //                           horizontal: 16.0),
                          //                   leading: const CircleAvatar(
                          //                     backgroundImage: NetworkImage(
                          //                         'https://media.sproutsocial.com/uploads/2019/08/chicago-bulls-case-study-feature-img.png'),
                          //                   ),
                          //                   onTap: () {},
                          //                 )
                          //             ],
                          //           ),
                          // Lists for Games
                          isLoading
                              ? const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              : searchResultTeam.isEmpty
                                  ? const Center(
                                      child: Text(
                                        "No games found",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        for (var team in searchResultTeam)
                                          ListTile(
                                            title: Text(
                                              team['teamname'],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 19),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                for (var category
                                                    in team['teamcategories'])
                                                  Text(
                                                    category,
                                                    style: const TextStyle(
                                                        fontSize: 17),
                                                  ),
                                              ],
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                            leading: const CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://media.sproutsocial.com/uploads/2019/08/chicago-bulls-case-study-feature-img.png'),
                                            ),
                                            onTap: () {},
                                          )
                                      ],
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
      ),
    );
  }
}
