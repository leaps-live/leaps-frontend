import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'User Formal Name',
                hintText: 'User Formal Name',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Birthday',
                hintText: 'Birthday',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Height (in inches)',
                hintText: 'Height',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Weight (in pounds)',
                hintText: 'Weight',
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
                  backgroundColor: Colors.grey,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
