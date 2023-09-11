import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/landing/forgot_password.dart';
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

  // TODO: change button color when all the fields are filled
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

  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.done:
        print('Sign in is complete');
        break;
      default:
        print(result);
    }
  }

  Future<void> signInUser(String username, String password) async {
    print('username signin: $username');
    print('password signin: $password');
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      await _handleSignInResult(result);
    } on AuthException catch (e) {
      print('Error signing in: ${e.message}');
    }
  }

  Future<void> googleSignIn() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.google,
      );
      safePrint('Sign in result: $result');
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }

  void _userLogin() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your email or username",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
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
      // AWS Cognito sign-in
      await signInUser(emailController.text, passwordController.text);
      print("signed in user through aws cognito");

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

          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }
      }

      print(allRequestsFailed);
      if (allRequestsFailed) {
        Fluttertoast.showToast(
          msg: "Login or password is wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red[400],
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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
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
                  labelText: 'Email',
                  hintText: 'Email',
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
              Center(
                  child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: const Text("Forgot Password?"),
              )),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        width: 120,
                        height: 1,
                        color: const Color(0xFFD7D7D7),
                      ),
                    ),
                    const TextSpan(
                      text: " Or sign in with ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        width: 120,
                        height: 1,
                        color: const Color(0xFFD7D7D7),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      googleSignIn();
                    },
                    child: Image.asset(
                      'assets/images/google.png', // 替换为你的图片路径
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.apple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
