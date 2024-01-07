import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchLeague.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FirstCreateLeague extends StatefulWidget {
  const FirstCreateLeague({super.key});
  static const routeName = '/first_create_league';

  @override
  State<FirstCreateLeague> createState() => _FirstCreateLeagueState();
}

class _FirstCreateLeagueState extends State<FirstCreateLeague> {
  String creatorName = '';
  bool isLoading = false;
  String leagueid = '';
  List<dynamic> teamArrays = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getLeagueData();
    getTeamArray();
  }

  Future<void> _getLeagueData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    try {
      var url = Uri.parse('http://localhost:8080/users/$userid/username');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          creatorName =
              response.body.replaceAll('"', ''); // Remove double quotes
          print(creatorName);
        });
      } else {
        print('fail request ${response.statusCode}');
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

  void getTeamArray() async {
    try {
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      leagueid = args["leagueid"];
      print("leagueid: $leagueid");
      final teamArray =
          await http.get(Uri.parse('http://localhost:8080/team/all/$leagueid'));

      if (teamArray.statusCode == 200) {
        setState(() {
          teamArrays = json.decode(teamArray.body);
        });
        print("teamArrays: $teamArrays");
      } else {
        print('fail request when requesting teamArray ${teamArray.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var leagueName = args["leagueName"];

    return isLoading
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator(color: primaryColor)),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(leagueName),
              automaticallyImplyLeading: false,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Color(0xFF747474),
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Team Members',
                    style: TextStyle(fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchLeague.routeName,
                                arguments: leagueid)
                            .then((result) {
                          if (result != null && result is bool && result) {
                            getTeamArray();
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 35,
                      )),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Joined',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.face,
                        size: 40,
                      ),
                      const SizedBox(width: 10.0),
                      Text(creatorName, style: const TextStyle(fontSize: 17)),
                      const Spacer(),
                      const Text(
                        "Creator",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    children: [
                      for (var team in teamArrays)
                        ListTile(
                          title: Text(
                            team['teamname'],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                          ),
                          subtitle: Row(
                            children: [
                              for (var category in team['teamcategories'] ?? [])
                                Row(
                                  children: [
                                    Text(
                                      category,
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                            ],
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
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
          );
  }
}
