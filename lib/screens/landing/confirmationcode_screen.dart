import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/main_screen.dart';

import 'package:leaps_frontend/utils/colors.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key, required this.arguments});

  final Map<String, dynamic> arguments;

  static const routeName = '/confirmationcode';

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  @override

  // Define controllers to capture user input
  final TextEditingController confirmationCodeController =
      TextEditingController();

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;
  bool isLoading = false;

  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.done:
        safePrint('Sign in is complete');
        break;
      default:
        safePrint(result);
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        break;
      default:
        safePrint('Confirming user...');
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
    print("emailtosend: $emailToSend");

    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: emailToSend,
        confirmationCode: confirmationCodeController.text,
      );
      // Check if further confirmations are needed or if
      // the sign up is complete.
      await _handleSignUpResult(result);
      // await signInUser(widget.email, widget.password);
      // print("signed in user");
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    } on AuthException catch (e) {
      safePrint('Error confirming user: ${e.message}');
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
      safePrint('Error signing in: ${e.message}');
    }
  }

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
