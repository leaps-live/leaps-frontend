import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/landing/login_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Define controllers to capture user input
  final TextEditingController userFirstNameController = TextEditingController();
  final TextEditingController userLastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  // make toast for incomplete form
  void _userRegister() async {
    if (userFirstNameController.text.isEmpty ||
        userLastNameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        emailController.text.isEmpty ||
        birthdayController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fullfil all the fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(
        msg: "The password is different from the confirmation password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    const String apiUrl = 'http://localhost:8080/users/register';

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      'userFirstName': userFirstNameController.text,
      'userLastName': userLastNameController.text,
      'username': usernameController.text,
      'userEmail': emailController.text,
      'userPassword': passwordController.text,
      'userBirthday': birthdayController.text,
      'userHeight': heightController.text,
      'userWeight': weightController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successfully sent data to the backend
        print('Data sent successfully!');
        Navigator.pushNamed(context, LoginScreen.routeName);
      } else {
        // Error handling if the request fails
        // print('Failed to send data. Error code: ${response.statusCode}');
        print(response);
      }
    } catch (e) {
      print('Error occurred while sending data: $e');
    }
  }

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    userFirstNameController.dispose();
    userLastNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: userFirstNameController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'User First Name',
                  hintText: 'User First Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: userLastNameController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'User Last Name',
                  hintText: 'User Last Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: usernameController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: confirmPasswordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: birthdayController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Birthday',
                  hintText: 'Birthday',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: heightController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Height (in inches)',
                  hintText: 'Height',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: weightController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Weight (in pounds)',
                  hintText: 'Weight',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 300,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16, // 设置默认字体大小
                      color: Colors.black, // 设置默认字体颜色
                    ),
                    children: [
                      TextSpan(
                        text: "By signing up, you agree to our ",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(fontWeight: FontWeight.bold), // 加粗样式
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(fontWeight: FontWeight.bold), // 加粗样式
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _userRegister();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        areAllFieldsFilled ? primaryColor : Colors.grey,
                    fixedSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Sign up'),
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
