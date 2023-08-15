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

  @override
  void initState() {
    super.initState();
    _getUserData();
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

  @override
  Widget build(BuildContext context) {
    String teamName = ModalRoute.of(context)?.settings?.arguments as String;

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
                            arguments: teamName);
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
                  )
                ],
              ),
            ),
          );
  }
}
