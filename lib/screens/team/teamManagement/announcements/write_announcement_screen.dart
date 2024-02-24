import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Team Announcement',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
