import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/creator/manageteams_screen.dart';
import 'package:leaps_frontend/screens/team/teamActions/team_members_selection_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';

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

  void _showDisbandAlert(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Disbanding a team cannot be undone',
            textAlign: TextAlign.left),
        content: const Text('All players will be notified.',
            textAlign: TextAlign.left),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: secondaryTextColor)),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pushNamed(context, ManageTeamsScreen.routeName);
            },
            child: const Text('Disband',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black)),
          ),
        ],
      ),
    );
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
        backgroundColor: primaryBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
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
                    size: const Size.fromRadius(25), // Image radius
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          children: <TextSpan>[
                            const TextSpan(text: 'No, I want to '),
                            TextSpan(
                                text: 'transfer',
                                style: const TextStyle(
                                    color: secondaryColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(context,
                                        TeamMembersSelectionScreen.routeName);
                                  }),
                            const TextSpan(text: ' ownership.'),
                          ]),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _showDisbandAlert(context);
                          },
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
      ),
    );
  }
}
