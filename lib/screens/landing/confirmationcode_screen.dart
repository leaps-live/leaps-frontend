import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/utils/colors.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key, required this.arguments});

  final Map<String, dynamic> arguments;

  static const routeName = '/confirmationcode';

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  // Define controllers to capture user input
  final TextEditingController confirmationCodeController =
      TextEditingController();

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;
  bool isLoading = false;

  Map<String, dynamic> searchResult = {};

  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.done:
        print('Sign in is complete');
        break;
      default:
        print(result);
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.done:
        print('Sign up is complete');
        break;
      default:
        print('Confirming user...');
        break;
    }
  }

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = confirmationCodeController.text.isNotEmpty;
    });
  }

  Future<void> confirmUser(Map<String, dynamic>? data) async {
    final String emailToSend =
        data!.containsKey('email') ? data['email'] : null;

    final String passwordToSend =
        data!.containsKey('password') ? data['password'] : null;
    print("emailtosend: $emailToSend");

    setState(() {
      isLoading = true;
    });

    const String apiUrl = 'http://localhost:8080/users/login';

    // TODO: handle case if email is null

    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: emailToSend,
        confirmationCode: confirmationCodeController.text,
      );

      // Check if further confirmations are needed or if
      // the sign up is complete.
      await _handleSignUpResult(result);
      await signInUser(emailToSend, passwordToSend);

      final loginResponse = http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          'userName': null,
          'userEmail': emailToSend,
          'userPassword': passwordToSend
        }),
        headers: {'Content-Type': 'application/json'},
      );
      final response = await Future.wait([loginResponse]);

      bool allRequestsFailed = true;

      for (final response in response) {
        print(response.statusCode);

        if (response.statusCode == 200) {
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

          print("signed in user");
          Fluttertoast.showToast(
            msg: "Successfully created account and signed in!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green[400],
            textColor: Colors.white,
          );
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        }
      }

      if (allRequestsFailed) {
        Fluttertoast.showToast(
          msg: "Failed to confirm",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
        );
      }
    } on AuthException catch (e) {
      print('Error confirming user: ${e.message}');
      Fluttertoast.showToast(
        msg: "Error confirming user: ${e.message}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
    } catch (e) {
      print('Error occurred while sending data: $e');
      Fluttertoast.showToast(
        msg: "Error occurred while sending data: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
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

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

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
              SizedBox(
                width: 300,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'A confirmation code has been sent to .',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              TextField(
                controller: confirmationCodeController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Confirmation Code',
                  hintText: 'Confirmation Code',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    confirmUser(data ?? {"nothing": "nothing"});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        areAllFieldsFilled ? primaryColor : Colors.grey,
                    fixedSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  child: isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Confirm'),
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
                      : const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
