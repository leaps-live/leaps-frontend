import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_index.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_tabbar.dart';
import 'package:http/http.dart' as http;

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});
  static const routeName = '/team';

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
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

    String teamid = '24dbe493-6e10-49d8-b8da-ae26f9dcbe4c';

    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/team/get/$teamid'));

      print(response.body);

      if (response.statusCode == 200) {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Teams",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            GestureDetector(
              child: const Icon(Icons.share),
              onTap: () {},
            )
          ],
        ),
        body: const Column(
          children: [Index(), tabBar()],
        ));
  }
}
