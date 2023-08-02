import 'package:flutter/material.dart';

class ManageDevices extends StatefulWidget {
  const ManageDevices({super.key});
  static const routeName = '/manage_devices';

  @override
  State<ManageDevices> createState() => _ManageDevicesState();
}

class _ManageDevicesState extends State<ManageDevices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manage Settings"),
          actions: [
            TextButton(
              onPressed: () {
                // do something for save button
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 125, 221),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Icon(
                Icons.computer,
                size: 80,
              ),
              Icon(
                Icons.phone_android,
                size: 80,
              ),
              Icon(
                Icons.phone_iphone,
                size: 80,
              ),
              Icon(
                Icons.watch,
                size: 80,
              )
            ],
          ),
        ));
  }
}
