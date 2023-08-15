import 'package:flutter/material.dart';
import '../../league/leaguePage/league_tabbar.dart';
import '../../league/leaguePage/league_index.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:remixicon/remixicon.dart';

class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});
  static const routeName = '/league';

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  bool isLoading = false;
  String? leagueid;
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

    leagueid = ModalRoute.of(context)?.settings?.arguments as String?;
    print(leagueid);

    try {
      final response = await http
          .get(Uri.parse('http://localhost:8080/leagues/get/$leagueid'));

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
    double screenWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
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
