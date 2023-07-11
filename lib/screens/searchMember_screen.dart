import 'package:flutter/material.dart';

class SearchMemberScreen extends StatelessWidget {
  static const routeName = '/search_member';

  const SearchMemberScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Another Page',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Another Page!',
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
