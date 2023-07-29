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

  Map<String, dynamic> searchResult = {};

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
                              hintText: "Search by username or userID",
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
              searchResult['username'] != null
                  ? GestureDetector(
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
                              margin:
                                  const EdgeInsets.only(left: 10), // 设置左边距为10
                              child: Text(
                                searchResult['username'] ?? 'No result',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(top: 240.0),
                      child: Text("No Result", style: TextStyle(fontSize: 20)),
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
    var apiUrl_id = Uri.parse('http://localhost:8080/users/$searchQuery');
    var apiUrl_name =
        Uri.parse('http://localhost:8080/users/username/$searchQuery');

    try {
      final response_id = http.get(apiUrl_id);
      final response_name = http.get(apiUrl_name);

      // 并行请求
      final response = await Future.wait([response_id, response_name]);

      for (final response in response) {
        if (response.statusCode == 200) {
          setState(() {
            searchResult = json.decode(response.body);
          });
          print(searchResult);
          break;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
