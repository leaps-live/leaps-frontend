import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/landing/confirmResetPassword_screen.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/account_security.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const routeName = '/forgot_password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Define controllers to capture user input
  final TextEditingController emailController = TextEditingController();

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;
  bool isLoading = false;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = emailController.text.isNotEmpty;
    });
  }

  Future<void> resetPassword() async {
    try {
      final result = await Amplify.Auth.resetPassword(
        username: emailController.text,
      );
      await _handleResetPasswordResult(result);
      final Map<String, dynamic> dataToSend = {
        'email': emailController.text,
      };

      Navigator.pushReplacementNamed(
          context, ConfirmResetPasswordScreen.routeName,
          arguments: dataToSend);
    } on AuthException catch (e) {
      safePrint('Error resetting password: ${e.message}');
    }
  }

  Future<void> _handleResetPasswordResult(ResetPasswordResult result) async {
    switch (result.nextStep.updateStep) {
      case AuthResetPasswordStep.confirmResetPasswordWithCode:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        Fluttertoast.showToast(
          msg: "Code  sent to your email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
        );
        break;
      case AuthResetPasswordStep.done:
        safePrint('Successfully reset password');
        break;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reset your password"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'Enter your email',
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
                    resetPassword();
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
                            Text('Send Code'),
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
                      : const Text('Send Code'),
                ),
              ),
            ],
          ),
        ));
  }
}
