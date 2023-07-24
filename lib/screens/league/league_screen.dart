import 'package:flutter/material.dart';

class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});
  static const routeName = '/league';

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Leagues",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(children: [Text("this is content")]),
    );
  }
}
