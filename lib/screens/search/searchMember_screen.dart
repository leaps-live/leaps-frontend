import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchMemberScreen extends StatefulWidget {
  const SearchMemberScreen({super.key});
  static const routeName = '/search_member';

  @override
  State<SearchMemberScreen> createState() => _SearchMemberScreenState();
}

class _SearchMemberScreenState extends State<SearchMemberScreen> {
  String searchQuery = '';
  bool isLoading = false;

  Map<String, dynamic> searchResult = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              hintText: "Search team/league/user",
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
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Players",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    isLoading
                        ? const SizedBox(
                            width: 30, // 设置宽度
                            height: 30, // 设置高度
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                              strokeWidth: 3,
                            ),
                          )
                        : searchResult['users'] != null
                            ? Column(
                                children: [
                                  for (var user in searchResult['users'])
                                    ListTile(
                                      title: Text(
                                        user['userfirstname'] +
                                            ' ' +
                                            user['userlastname'],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 19),
                                      ),
                                      subtitle: Text(
                                        user['username'],
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                      leading: const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://i.guim.co.uk/img/media/851fc16381d2c89a1b65657ab258dcded01c9d50/0_0_5164_3098/master/5164.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=7c65528203e4a01f298159470abf19ba'),
                                      ),
                                      onTap: () {},
                                    )
                                ],
                              )
                            : const Text("No result found")
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Teams",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    isLoading
                        ? const SizedBox(
                            width: 30, // 设置宽度
                            height: 30, // 设置高度
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                              strokeWidth: 3,
                            ),
                          )
                        : searchResult['teams'] != null
                            ? Column(
                                children: [
                                  for (var team in searchResult['teams'])
                                    ListTile(
                                      title: Text(
                                        team['teamname'],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 19),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          for (var category
                                              in team['teamcategories'])
                                            Text(
                                              category,
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
                                        ],
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                      leading: const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://media.sproutsocial.com/uploads/2019/08/chicago-bulls-case-study-feature-img.png'),
                                      ),
                                      onTap: () {},
                                    )
                                ],
                              )
                            : const Text("No result found")
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Leagues",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    isLoading
                        ? const SizedBox(
                            width: 30, // 设置宽度
                            height: 30, // 设置高度
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                              strokeWidth: 3,
                            ),
                          )
                        : searchResult['leagues'] != null
                            ? Column(
                                children: [
                                  for (var league in searchResult['leagues'])
                                    ListTile(
                                      title: Text(
                                        league['leaguename'],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 19),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          for (var category
                                              in league['leaguecategories'])
                                            Text(
                                              category,
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
                                        ],
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                      leading: const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://a4.espncdn.com/combiner/i?img=%2Fi%2Fespn%2Fmisc_logos%2F500%2Fnba.png'),
                                      ),
                                      onTap: () {},
                                    )
                                ],
                              )
                            : const Text("No result found")
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Games",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    isLoading
                        ? const SizedBox(
                            width: 30, // 设置宽度
                            height: 30, // 设置高度
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text("No result found")
                  ],
                ),
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
      searchResult = {};
    });

    var apiUrl = 'http://localhost:8080/search/all';

    final Map<String, dynamic> userData = {
      'userinput': searchQuery,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          searchResult = json.decode(response.body);
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false; // 隐藏loading状态
      });
    }
  }
}
