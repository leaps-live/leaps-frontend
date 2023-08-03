import 'package:flutter/material.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});
  static const routeName = '/change_username';

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Username"),
          actions: [
            TextButton(
              onPressed: () {
                // do something for save button
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 125, 221),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Contain only letters, numbers, underscores and periods.",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ));
  }
}
