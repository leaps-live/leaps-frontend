import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  userSignOut();
                  Navigator.pushNamed(context, MainScreen.routeName);
                },
                child: const Text(
                  'Log out',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                onPressed: () {
                  deleteAccount();
                  Navigator.pushNamed(context, MainScreen.routeName);
                },
                child: const Text(
                  'Delete account',
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ),
              ),
            ],
          ),
        ));
  }

  void userSignOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    Fluttertoast.showToast(
      msg: "Sign out successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  void deleteAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    // Define the API endpoint URL
    String apiUrl = 'http://localhost:8080/users/$userid';

    try {
      final response = await http.delete(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Profile updated successfully
        print('Account deleted successfully!');

        await prefs.remove('user');

        Fluttertoast.showToast(
          msg: "Account deleted successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      } else {
        print('Error updating profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while deleting account: $e');
    }
  }
}
