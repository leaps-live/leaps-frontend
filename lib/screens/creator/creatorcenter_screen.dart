import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/game/create_game_screen.dart';
import 'package:leaps_frontend/screens/game/editgame_screen.dart';
import 'package:leaps_frontend/screens/league/leaguePage/league_screen.dart';
import 'package:leaps_frontend/screens/livestream/createlivestream_screen.dart';
import 'package:leaps_frontend/screens/playground/s3_upload_test_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/createLeague_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createteam_screen_stepone.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
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
    print(userid);

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
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  // void getTeamArray() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userid = prefs.getString('userid');
  //   print(userid);

  //   var apiUrl = Uri.parse('http://localhost:8080/team/getTeam/$userid');
  //   try {
  //     var response = await http.get(apiUrl);
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         searchResultTeam = json.decode(response.body);
  //       });
  //       print(searchResultTeam);
  //     } else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void getLeagueArray() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userid = prefs.getString('userid');

  //   var apiUrl = Uri.parse('http://localhost:8080/leagues/getLeague/$userid');
  //   try {
  //     var response = await http.get(apiUrl);
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         searchResultLeague = json.decode(response.body);
  //       });
  //       print(searchResultLeague);
  //     } else {
  //       print(response.statusCode);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
      if (!mounted) return;
      setState(() {
        if (!mounted) return;
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
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Creator Center',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.black26,
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/CreateTeam.png',
                                      fit: BoxFit.cover,
                                      width: 90,
                                      height: 90,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Team',
                                      style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.black26,
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/CreateTeam.png',
                                      fit: BoxFit.cover,
                                      width: 90,
                                      height: 90,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Team',
                                      style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  "Manage",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
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
                        fontWeight: FontWeight.w600,
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
                      height: 800, // Adjust the height as needed
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Lists for Teams
                          isLoading
                              ? const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: primaryColor),
                                  ),
                                )
                              : searchResultTeam.isNotEmpty
                                  ? Column(
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
                                                  Row(
                                                    children: [
                                                      Text(
                                                        category,
                                                        style: const TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      )
                                                    ],
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
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                TeamScreen.routeName,
                                                arguments: team['teamid'],
                                              );
                                            },
                                          )
                                      ],
                                    )
                                  : const Center(
                                      child: Text(
                                        "No teams found",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),

                          // Lists for Leagues
                          isLoading
                              ? const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              : searchResultLeague.isEmpty
                                  ? const Center(
                                      child: Text(
                                        "No leagues found",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        for (var leagues in searchResultLeague)
                                          for (var league in leagues)
                                            ListTile(
                                              title: Text(
                                                league['leaguename'],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 19),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  for (var category in league[
                                                      'leaguecategories'])
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
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  LeagueScreen.routeName,
                                                  arguments: league['leagueid'],
                                                );
                                              },
                                            )
                                      ],
                                    ),
                          // Lists for Games
                          isLoading
                              ? const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: primaryColor),
                                  ),
                                )
                              : searchResultTeam.isEmpty
                                  ? const Center(
                                      child: Text(
                                        "No games found",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
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
                                                  Row(
                                                    children: [
                                                      Text(
                                                        category,
                                                        style: const TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      )
                                                    ],
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
