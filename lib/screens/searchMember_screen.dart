import 'package:flutter/material.dart';

class SearchMemberScreen extends StatelessWidget {
  static const routeName = '/search_member';

  const SearchMemberScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Another Page',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   iconTheme: const IconThemeData(color: Colors.black),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search by username',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'PlaceHolder',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const Text(
              'PlaceHolder',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const Text(
              'PlaceHolder',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const Text(
              'PlaceHolder',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // 返回到前一个页面
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
