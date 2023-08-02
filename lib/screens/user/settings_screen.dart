import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    print(userid);
    if (userid != null) {
      setState(() {
        isLogin = true;
      });
    }
    print(isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text(
                  'Account Security',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("NOTIFICATION",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              ListTile(
                title: const Text(
                  'Manage Settings',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'PRIVACY',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text(
                  'Blocked Contacts',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("ABOUT",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              ListTile(
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  'Support Us',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
              ),
              if (isLogin)
                ListTile(
                  title: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  onTap: () {
                    userLogOut();
                    Navigator.pushNamed(context, MainScreen.routeName);
                  },
                ),
              if (isLogin)
                ListTile(
                  title: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  onTap: () {
                    deleteAccount();
                    Navigator.pushNamed(context, MainScreen.routeName);
                  },
                ),
            ],
          ),
        ));
  }

  void userLogOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('userid');
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
        await prefs.remove('userid');

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
