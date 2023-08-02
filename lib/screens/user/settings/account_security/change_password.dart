import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  static const routeName = '/change_password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Change Password"),
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  hintText: 'Current Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: 'New Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  hintText: 'Confirm New Password',
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
