import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // do something after clicking create button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.g_translate),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
