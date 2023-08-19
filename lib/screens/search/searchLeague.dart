import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:leaps_frontend/utils/colors.dart';

class SearchLeague extends StatefulWidget {
  const SearchLeague({super.key});
  static const routeName = '/search_league';

  @override
  State<SearchLeague> createState() => _SearchLeagueState();
}

class _SearchLeagueState extends State<SearchLeague> {
  String searchQuery = '';
  bool isLoading = false;
  bool addLoading = false;
  List<dynamic> searchResults = [];
  String leagueid = '';

  void _searchMember() async {
    setState(() {
      isLoading = true;
    });

    var apiUrl = 'http://localhost:8080/team/search/teamname';

    final Map<String, dynamic> userData = {
      'teamname': searchQuery,
    };

    print(userData);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          searchResults = json.decode(response.body);
        });
        print(searchResults);
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

  void addTeam(result) async {
    setState(() {
      addLoading = true;
    });

    var apiUrl = 'http://localhost:8080/leagueteam/add';

    final Map<String, dynamic> userData = {
      'leagueid': leagueid,
      'teamid': result['teamid'],
      'teamCategories': result['teamCategories'],
    };

    print(userData);

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Team added to league",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );

        Navigator.pop(context, true);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        addLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    leagueid = ModalRoute.of(context)?.settings?.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0), // 左边距
                        child: GestureDetector(
                          child: const Icon(Icons.search),
                          onTap: () {
                            _searchMember();
                          },
                        ),
                      ),
                      const SizedBox(width: 8), // 间距
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0), // 左边距
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: "Search by teamName",
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 13),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Colors.black),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Text("Cancel"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              isLoading
                  ? const Expanded(
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: primaryColor,
                            strokeWidth: 4,
                          ),
                        ),
                      ),
                    )
                  : searchResults.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              final result = searchResults[index];
                              return ListTile(
                                title: Text(
                                  result['teamname'],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 19),
                                ),
                                subtitle: Row(
                                  children: [
                                    for (var category
                                        in result['teamcategories'])
                                      Row(
                                        children: [
                                          Text(
                                            category,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://a4.espncdn.com/combiner/i?img=%2Fi%2Fespn%2Fmisc_logos%2F500%2Fnba.png'),
                                ),
                                onTap: () {
                                  addTeam(result);
                                },
                              );
                            },
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 240.0),
                          child:
                              Text("No Result", style: TextStyle(fontSize: 20)),
                        ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
