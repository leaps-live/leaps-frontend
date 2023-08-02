import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_index.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_tabbar.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});
  static const routeName = '/team';

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
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
