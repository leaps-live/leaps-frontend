import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchTeam.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FirstCreateTeam extends StatefulWidget {
  const FirstCreateTeam({super.key});
  static const routeName = '/first_create_team';

  @override
  State<FirstCreateTeam> createState() => _FirstCreateTeamState();
}

class _FirstCreateTeamState extends State<FirstCreateTeam> {
  String creatorName = '';
  bool isLoading = false;
  List<dynamic> playerArrays = [];
  String teamid = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getUserData();
    getPlayerArray();
  }

  Future<void> _getUserData() async {
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

  void getPlayerArray() async {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    teamid = args["teamid"];
    print("Got teamid !!!!: $teamid");

    try {
      final playerArray = await http.get(
          Uri.parse('http://localhost:8080/teamplayer/allplayers/$teamid'));
      print(playerArray.body);

      if (playerArray.statusCode == 200) {
        setState(() {
          playerArrays = json.decode(playerArray.body);
        });
        print("teamArrays: $playerArrays");
      } else {
        print(
            'fail request when requesting playerArray ${playerArray.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var teamName = args["teamName"];

    return isLoading
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator(color: primaryColor)),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(teamName),
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
                        Navigator.pushNamed(context, SearchTeam.routeName,
                                arguments: teamid)
                            .then((result) {
                          if (result != null && result is bool && result) {
                            getPlayerArray();
                          }
                        });
                        ;
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
                  Column(
                    children: [
                      for (var player in playerArrays)
                        ListTile(
                          title: Text(
                            player['userfirstname'] +
                                ' ' +
                                player['userlastname'],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                          ),
                          subtitle: Text(
                            player['username'],
                            style: const TextStyle(fontSize: 17),
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
