import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/user/settings/account_security/account_security.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailConfirmationCodeScreen extends StatefulWidget {
  const EmailConfirmationCodeScreen({super.key, required this.arguments});

  final Map<String, dynamic> arguments;

  static const routeName = '/emailconfirmationcode';

  @override
  State<EmailConfirmationCodeScreen> createState() =>
      _EmailConfirmationCodeScreenState();
}

class _EmailConfirmationCodeScreenState
    extends State<EmailConfirmationCodeScreen> {
  // Define controllers to capture user input
  final TextEditingController confirmationCodeController =
      TextEditingController();

  // change button color when all the fields are filled
  bool areAllFieldsFilled = false;
  bool isLoading = false;

  late Map<String, dynamic> user;
  late String userId;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = confirmationCodeController.text.isNotEmpty;
    });
  }

  Future<void> verifyAttributeUpdate(Map<String, dynamic>? data) async {
    final String newEmailToSend =
        data!.containsKey('newEmail') ? data['newEmail'] : null;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    user = jsonDecode(userJsonString!);
    userId = user['userid'];

    if (confirmationCodeController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email is Empty",
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
    });

    // Create a map with the collected data
    final Map<String, dynamic> userData = {'newEmail': newEmailToSend};

    String apiUrl = 'http://localhost:8080/users/changeemail/$userId';

    try {
      await Amplify.Auth.confirmUserAttribute(
        userAttributeKey: AuthUserAttributeKey.email,
        confirmationCode: confirmationCodeController.text,
      );

      // TODO: Change Email on backend
      final response = await http.put(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successfully sent data to the backend

        print('Successfully changed email');

        Fluttertoast.showToast(
          msg: "Successfully updated email!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AccountSecurity.routeName);
      }
    } on AuthException catch (e) {
      safePrint('Error confirming attribute update: ${e.message}');
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmation Code to change your email',
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
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'A confirmation code has been sent to $data[codeDestination].',
                        style: const TextStyle(fontWeight: FontWeight.normal),
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
                    verifyAttributeUpdate(data);
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
