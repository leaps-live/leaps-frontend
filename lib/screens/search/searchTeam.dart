import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchTeam extends StatefulWidget {
  const SearchTeam({super.key});
  static const routeName = '/search_team';

  @override
  State<SearchTeam> createState() => _SearchTeamState();
}

class _SearchTeamState extends State<SearchTeam> {
  String searchQuery = '';
  bool isLoading = false;
  bool addLoading = false;
  String teamName = '';
  List<dynamic> searchResults = [];

  void addPlayer(result) async {
    setState(() {
      addLoading = true;
    });

    // try {
    //   final getID = await http.get(
    //     Uri.parse('http://localhost:8080/team/getid/$teamName'),
    //   );

    //   print(getID.body);
    // } catch (e) {
    //   print(e);
    // }

    var apiUrl = 'http://localhost:8080/teamplayer/add';

    final Map<String, dynamic> userData = {
      'teamid': '42bdd764-b233-458f-872d-b0df5c717e94',
      'userid': result['userid'],
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
          msg: "Player added to team",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );

        Navigator.pop(context);
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
    teamName = ModalRoute.of(context)?.settings?.arguments as String ?? '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
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
                                hintText: "Search by username",
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 13),
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
                                return ListTile(
                                  title: Text(
                                    result['userfirstname'] +
                                        ' ' +
                                        result['userlastname'],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 19),
                                  ),
                                  subtitle: Text(
                                    result['username'],
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  leading: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://i.guim.co.uk/img/media/851fc16381d2c89a1b65657ab258dcded01c9d50/0_0_5164_3098/master/5164.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=7c65528203e4a01f298159470abf19ba'),
                                  ),
                                  onTap: () {
                                    addPlayer(result);
                                  },
                                );
                              },
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(top: 240.0),
                            child: Text("No Result",
                                style: TextStyle(fontSize: 20)),
                          ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchMember() async {
    setState(() {
      isLoading = true;
    });

    var apiUrl = 'http://localhost:8080/users/search/username';

    final Map<String, dynamic> userData = {
      'userinput': searchQuery,
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
