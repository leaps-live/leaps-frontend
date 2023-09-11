import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/email_confirmationcode_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});
  static const routeName = '/change_email';

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  late Map<String, dynamic> user;
  late String userEmail;
  String? codeDestination;
  String? codeDeliveryMedium;

  // Define controllers to capture user input
  final TextEditingController newEmailController = TextEditingController();

  // add loading effect for initState
  bool isInit = false;

  bool areAllFieldsFilled = false;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = newEmailController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      isInit = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    user = jsonDecode(userJsonString!);
    userEmail = user['useremail'];
    setState(() {
      isInit = false;
    });
  }

  Future<void> updateUserEmail() async {
    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: AuthUserAttributeKey.email,
        value: newEmailController.text,
      );
      _handleUpdateUserAttributeResult(result);

      final Map<String, dynamic> dataToSend = {
        'codeDestination': codeDestination,
        'codeDeliveryMedium': codeDeliveryMedium,
        'newEmail': newEmailController.text,
      };

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(
          context, EmailConfirmationCodeScreen.routeName,
          arguments: dataToSend);
    } on AuthException catch (e) {
      safePrint('Error updating user attribute: ${e.message}');
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

  void _handleUpdateUserAttributeResult(
    UpdateUserAttributeResult result,
  ) {
    switch (result.nextStep.updateAttributeStep) {
      case AuthUpdateAttributeStep.confirmAttributeWithCode:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthUpdateAttributeStep.done:
        safePrint('Successfully updated attribute');
        Fluttertoast.showToast(
          msg: "Successfully updated email!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
        );
        break;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    setState(() {
      codeDestination = codeDeliveryDetails.destination;
      codeDeliveryMedium = codeDeliveryDetails.deliveryMedium.name;
    });

    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );

    Fluttertoast.showToast(
      msg:
          'A confirmation code has been sent to $codeDeliveryDetails.destination Please check your $codeDeliveryDetails.deliveryMedium.name for the code.',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green[400],
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isInit
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator(color: primaryColor)))
        : Scaffold(
            appBar: AppBar(
              title: const Text("Change Email"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Current Email: $userEmail",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextField(
                    controller: newEmailController,
                    onChanged: (value) {
                      _checkIfFieldFilled(); // Update button state on input change
                    },
                    decoration: const InputDecoration(
                      labelText: 'New Email',
                      hintText: 'New Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateUserEmail();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          areAllFieldsFilled ? primaryColor : Colors.grey,
                      fixedSize: const Size(300, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Send Verification Email',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ));
  }
}
