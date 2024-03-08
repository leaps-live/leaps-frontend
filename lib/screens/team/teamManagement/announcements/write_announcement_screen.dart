import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:intl/intl.dart';

class WriteAnnouncementScreen extends StatefulWidget {
  const WriteAnnouncementScreen({super.key});
  static const routeName = '/write_announcement';

  @override
  State<WriteAnnouncementScreen> createState() =>
      _WriteAnnouncementScreenState();
}

class _WriteAnnouncementScreenState extends State<WriteAnnouncementScreen> {
  final pinController = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Announcement',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Send',
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Post Your Announcement...',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Pin',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(width: 10),
                    AdvancedSwitch(
                      inactiveColor: secondaryTextColor,
                      controller: pinController,
                      activeColor: primaryColor,
                      width: 37,
                      height: 20,
                    ),
                  ],
                ),
                Spacer(),
                Text('1000 characters',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
