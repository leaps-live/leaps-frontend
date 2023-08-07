import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchLeague extends StatefulWidget {
  const SearchLeague({super.key});
  static const routeName = '/search_league';

  @override
  State<SearchLeague> createState() => _SearchLeagueState();
}

class _SearchLeagueState extends State<SearchLeague> {
  String searchQuery = '';
  bool isLoading = false;

  List<dynamic> searchResults = [];

  @override
  Widget build(BuildContext context) {
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
                            color: Colors.black,
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
                              return GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: Icon(
                                        Icons.abc,
                                        size: 50,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          result['teamname'] ?? 'No result',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
      setState(() {
        isLoading = false;
      });
    }
  }
}
