import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/account_security.dart';
import 'package:leaps_frontend/screens/user/settings/notifications/notifications.dart';
import 'package:leaps_frontend/screens/user/settings/privacy_settings/privacy_settings.dart';
import 'package:leaps_frontend/utils/colors.dart';
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
                onTap: () {
                  Navigator.pushNamed(context, AccountSecurity.routeName);
                },
              ),
              ListTile(
                title: const Text(
                  'Notifications',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pushNamed(context, Notifications.routeName);
                },
              ),
              ListTile(
                title: const Text(
                  'Privacy Settings',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pushNamed(context, PrivacySettings.routeName);
                },
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
                    style: TextStyle(color: Colors.red, fontSize: 19),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  onTap: () {
                    userLogOut();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      MainScreen.routeName,
                      (route) => false,
                    );
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
}
