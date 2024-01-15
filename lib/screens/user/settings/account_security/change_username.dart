import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/account_security.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});
  static const routeName = '/change_username';

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  late Map<String, dynamic> user;
  late String username;
  late String userid;

  // add loading effect for initState
  bool isInit = false;
  bool isLoading = false;
  bool areAllFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Define controllers to capture user input
  final TextEditingController newUsernameController = TextEditingController();

  Future<void> _getUserData() async {
    setState(() {
      isInit = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    user = jsonDecode(userJsonString!);
    username = user['username'];
    userid = user['userid'];

    setState(() {
      isInit = false;
    });
  }

  void _checkIfFieldFilled() {
    setState(() {
      areAllFieldsFilled = newUsernameController.text.isNotEmpty;
    });
  }

  Future<void> updateUsername() async {
    setState(() {
      isLoading = true;
    });

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      'newUsername': newUsernameController.text
    };

    String apiUrl = 'http://localhost:8080/users/changeusername/$userid';

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successfully sent data to the backend

        // Update Shared Preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', response.body);
        String? user = prefs.getString('user');
        print('User value: $user');

        print('Successfully changed username');

        Fluttertoast.showToast(
          msg: "Successfully updated username!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green[400],
          textColor: Colors.white,
        );

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AccountSecurity.routeName);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "There was an error: $e",
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

  @override
  Widget build(BuildContext context) {
    return isInit
        ? const Scaffold(
            backgroundColor: primaryBackgroundColor,
            body: Center(child: CircularProgressIndicator(color: primaryColor)))
        : Scaffold(
            backgroundColor: primaryBackgroundColor,
            appBar: AppBar(
              title: const Text("Change Username"),
              backgroundColor: primaryBackgroundColor,
              actions: [
                TextButton(
                  onPressed: () {
                    updateUsername();
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
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Current Username: $username",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  TextField(
                    controller: newUsernameController,
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
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ));
  }
}
