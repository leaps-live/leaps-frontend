import 'package:flutter/material.dart';

class SearchMemberScreen extends StatefulWidget {
  const SearchMemberScreen({super.key});
  static const routeName = '/search_member';

  @override
  State<SearchMemberScreen> createState() => _SearchMemberScreenState();
}

class _SearchMemberScreenState extends State<SearchMemberScreen> {
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
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0), // 左边距
                        child: Icon(Icons.search),
                      ),
                      const SizedBox(width: 8), // 间距
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0), // 左边距
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search by username",
                              hintStyle: TextStyle(color: Colors.black),
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
              Row(
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
                      margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
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
                      margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
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
                      margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
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
                      margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                      child: const Text(
                        "Placeholder",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
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
