import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/account_security.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  static const routeName = '/change_password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class User {
  String userid;
  String firstName;
  String lastName;

  User({required this.userid, required this.firstName, required this.lastName});

  // Convert User object to Map
  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'userfirstname': firstName,
      'userlastname': lastName
    };
  }

  // Create User object from Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['userid'],
      firstName: json['userfirstname'],
      lastName: json['userlastname'],
    );
  }
}

class _ChangePasswordState extends State<ChangePassword> {
  // Define controllers to capture user input
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  bool areAllFieldsFilled = false;
  bool isLoading = false;

  late Map<String, dynamic> user;

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = currentPasswordController.text.isNotEmpty &&
          newPasswordController.text.isNotEmpty &&
          confirmNewPasswordController.text.isNotEmpty;
    });
  }

  Future<void> changeUserPassword() async {
    if (currentPasswordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your current password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    if (newPasswordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter your new password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    if (confirmNewPasswordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please confirm your new password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    if (newPasswordController.text != confirmNewPasswordController.text) {
      Fluttertoast.showToast(
        msg: "Passwords do not match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
      return;
    }

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      'newPassword': newPasswordController.text
    };

    try {
      updatePassword(
          oldPassword: currentPasswordController.text,
          newPassword: newPasswordController.text);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userJsonString = prefs.getString('user');
      user = jsonDecode(userJsonString!);
      String userid = user['userid'];

      String apiUrl = 'http://localhost:8080/users/changepassword/$userid';

      print('userid $userid');

      setState(() {
        isLoading = true;
      });

      final changePasswordResponse = http.put(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );
      final response = await Future.wait([changePasswordResponse]);

      bool allRequestsFailed = true;

      for (final response in response) {
        print(response.statusCode);

        if (response.statusCode == 200) {
          // Successfully sent data to the backend
          print('Successfully changed password!');

          Fluttertoast.showToast(
            msg: "Successfully changed password!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green[400],
            textColor: Colors.white,
          );

          allRequestsFailed = false;

          Navigator.pushReplacementNamed(context, AccountSecurity.routeName);
        }
      }

      if (allRequestsFailed) {
        Fluttertoast.showToast(
          msg: "Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Something went wrong.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await Amplify.Auth.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      print("Successfully changed password for Cognito");
    } on AuthException catch (e) {
      safePrint('Error updating password: ${e.message}');
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryBackgroundColor,
        appBar: AppBar(
          backgroundColor: primaryBackgroundColor,
          title: const Text("Change Password"),
          actions: [
            TextButton(
              onPressed: () {
                changeUserPassword();
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 125, 221),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: currentPasswordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                  hintText: 'Current Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: newPasswordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  hintText: 'New Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: confirmNewPasswordController,
                onChanged: (value) {
                  _checkIfFieldFilled(); // Update button state on input change
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  hintText: 'Confirm New Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Password must be at least 8 characters and contains only letters, numbers, underscores and periods.",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ));
  }
}
