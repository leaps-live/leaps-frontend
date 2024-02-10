import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class DisbandTeamScreen extends StatefulWidget {
  const DisbandTeamScreen({super.key});

  static const routeName = '/disband_team';

  @override
  State<DisbandTeamScreen> createState() => _DisbandTeamScreenState();
}

class _DisbandTeamScreenState extends State<DisbandTeamScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Disband team',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Do you want to disband this team?",
              style: TextStyle(
                  color: primaryText,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            const SizedBox(height: 25),
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20), // Image radius
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Mighty Dragons',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black),
                textAlign: TextAlign.left,
              )
            ]),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Text(
                    "No, I want to transfer ownership.",
                    style: TextStyle(
                        color: primaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          fixedSize: const Size(300, 43),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
