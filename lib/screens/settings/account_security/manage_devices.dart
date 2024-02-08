import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

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
        backgroundColor: primaryBackgroundColor,
        appBar: AppBar(
          title: const Text("Manage Settings"),
          backgroundColor: primaryBackgroundColor,
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
                  fontWeight: FontWeight.w600,
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
