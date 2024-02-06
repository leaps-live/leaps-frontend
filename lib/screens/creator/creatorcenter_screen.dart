import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/creator/managegames_screen.dart';
import 'package:leaps_frontend/screens/creator/manageteams_screen.dart';
import 'package:leaps_frontend/screens/game/create_game_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/createteam_screen_stepone.dart';
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
                          onTap: () {
                            Navigator.pushNamed(
                                context, CreateTeamSteponeScreen.routeName);
                          },
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
                                      width: 110,
                                      height: 110,
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
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CreateTeamSteponeScreen.routeName);
                          },
                          splashColor: Colors.black26,
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/CreateGame.png',
                                      fit: BoxFit.cover,
                                      width: 110,
                                      height: 110,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Game',
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
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(
                            context, ManageTeamsScreen.routeName)
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12)),
                      child: const Row(
                        children: [
                          Text('Teams (3)',
                              style: TextStyle(
                                  color: primaryText,
                                  fontWeight: FontWeight.w600)),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: secondaryTextColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(
                            context, ManageGamesScreen.routeName)
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12)),
                      child: const Row(
                        children: [
                          Text('Games (2)',
                              style: TextStyle(
                                  color: primaryText,
                                  fontWeight: FontWeight.w600)),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: secondaryTextColor,
                          )
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
