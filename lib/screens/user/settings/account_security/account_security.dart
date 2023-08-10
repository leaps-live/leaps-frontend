import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/change_password.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/manage_devices.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'change_email.dart';
import 'change_username.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({super.key});
  static const routeName = '/account_security';

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
  bool isLogin = false;
  String username = '';

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
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8080/users/$userid/username'));

      if (response.statusCode == 200) {
        setState(() {
          username = response.body.replaceAll('"', '');
        });
        print('Username: $username');
      } else {
        print('fail request ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  void showConfirmationDialog() {
    if (Theme.of(context).platform == TargetPlatform.android) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Warning',
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            content: const Text(
                'Are you sure you want to delete your account? This action is irreversible!!!'),
            actions: [
              TextButton(
                onPressed: () {
                  deleteAccount();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    MainScreen.routeName,
                    (route) => false,
                  );
                },
                child: const Text('Yes, delete'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xFF747474)),
                ),
              ),
            ],
          );
        },
      );
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(
              'Do you want to delete this account?',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Username: $username',
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel',
                    style: TextStyle(color: Color(0xFF747474))),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  deleteAccount();
                  Navigator.pushReplacementNamed(context, MainScreen.routeName);
                },
                child: const Text(
                  'Yes, delete',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Account Security"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Username',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ChangeUsername.routeName);
                },
              ),
              ListTile(
                title: const Text(
                  'Email',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ChangeEmail.routeName);
                },
              ),
              ListTile(
                title: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ChangePassword.routeName);
                },
              ),
              ListTile(
                title: const Text(
                  'Manage Devices',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ManageDevices.routeName);
                },
              ),
              if (isLogin)
                ListTile(
                  title: const Text(
                    'Delete Account',
                    style: TextStyle(color: primaryColor, fontSize: 19),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  onTap: () {
                    showConfirmationDialog();
                  },
                ),
            ],
          ),
        ));
  }
}
