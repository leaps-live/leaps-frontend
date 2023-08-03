import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  bool showPassword = false;
  Map<String, dynamic> searchResult = {};

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _userLogin() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your email or username",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    setState(() {
      isLoading = true;
      searchResult = {};
    });

    const String apiUrl = 'http://localhost:8080/users/login';

    // Check to see if input is an email
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      'userName': emailValid ? null : emailController.text,
      'userEmail': emailValid ? emailController.text : null,
      'userPassword': passwordController.text,
    };

    try {
      final loginResponse = http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );
      final response = await Future.wait([loginResponse]);

      bool allRequestsFailed = true;

      for (final response in response) {
        print(response.statusCode);

        if (response.statusCode == 200) {
          // Successfully sent data to the backend
          print('Data sent successfully!');
          allRequestsFailed = false;
          print(response.body);

          setState(() {
            searchResult = json.decode(response.body);
          });

          // use shared preference to store response
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('user', response.body);
          String? user = prefs.getString('user');
          print('User value: $user');

          prefs.setString('userid', searchResult['userid']);
          String? userid = prefs.getString('userid');
          print('Userid: $userid');

          Navigator.pushNamed(context, MainScreen.routeName);
        }
      }

      print(allRequestsFailed);
      if (allRequestsFailed) {
        Fluttertoast.showToast(
          msg: "Login or password is wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print('Error occurred while sending data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: emailController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'UserEmail / Username',
                  hintText: 'UserEmail / Username',
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
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _userLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        areAllFieldsFilled ? primaryColor : Colors.grey,
                    fixedSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // child: const Text('Login'),
                  child: isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login'),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          ],
                        )
                      : const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.g_translate),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MainScreen.routeName);
                    },
                    child: const Text(
                      "Continue with Google",
                      style: TextStyle(fontSize: 15),
                    ),
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
