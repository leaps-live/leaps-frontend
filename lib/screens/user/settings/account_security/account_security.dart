import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/change_password.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/manage_devices.dart';

import 'change_email.dart';
import 'change_username.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({super.key});
  static const routeName = '/account_security';

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
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
            ],
          ),
        ));
  }
}
