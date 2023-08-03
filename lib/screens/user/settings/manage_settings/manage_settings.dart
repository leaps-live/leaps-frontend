import 'package:flutter/material.dart';

import '../account_security/change_username.dart';

class ManageSettings extends StatefulWidget {
  const ManageSettings({super.key});
  static const routeName = '/manage_settings';

  @override
  State<ManageSettings> createState() => _ManageSettingsState();
}

class _ManageSettingsState extends State<ManageSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Manage Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Toggle',
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
            ],
          ),
        ));
  }
}
