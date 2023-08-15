import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchLeague.dart';
import 'package:leaps_frontend/screens/search/searchTeam.dart';
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
  void initState() {
    super.initState();
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
      setState(() {
        isLoading = false;
      });
    }
  }

  void getTeamArray() async {
    try {
      final teamArray =
          await http.get(Uri.parse('http://localhost:8080/team/all/$leagueid'));
      print(teamArray.body);

      if (teamArray.statusCode == 200) {
        teamArrays = json.decode(teamArray.body);
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
    leagueid = args["leagueid"];

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
                    Navigator.of(context).pop();
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
                            arguments: leagueid);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 35,
                      )),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Joined',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  for (var team in teamArrays) Text(team['teamname'])
                ],
              ),
            ),
          );
  }
}
