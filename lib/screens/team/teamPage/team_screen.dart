import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_index.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_tabbar.dart';
import 'package:http/http.dart' as http;
import 'package:remixicon/remixicon.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});
  static const routeName = '/team';

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  bool isLoading = false;
  String? teamid;
  Map<String, dynamic> searchResult = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      isLoading = true;
    });

    teamid = ModalRoute.of(context)?.settings?.arguments as String?;
    print(teamid);

    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080/team/get/$teamid'));

      print(response.body);

      if (response.statusCode == 200) {
        searchResult = json.decode(response.body);
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
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              actions: [
                IconButton(
                  icon: const Icon(Remix.share_circle_line,
                      color: Color(0xFF2E3A59)),
                  onPressed: () {},
                )
              ],
            ),
            body: Column(
              children: [Index(searchResult: searchResult), tabBar()],
            ));
  }
}
