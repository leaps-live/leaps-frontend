import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../league/leaguePage/league_tabbar.dart';
import '../../league/leaguePage/league_index.dart';

class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});
  static const routeName = '/league';

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Leagues",
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
