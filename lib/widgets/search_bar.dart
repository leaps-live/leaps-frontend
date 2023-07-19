import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}
