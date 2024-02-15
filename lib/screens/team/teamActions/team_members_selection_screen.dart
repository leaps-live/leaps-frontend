import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/teamActions/disbandTeam_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:flutter/gestures.dart';

class TeamMembersSelectionScreen extends StatefulWidget {
  const TeamMembersSelectionScreen({super.key});

  static const routeName = '/team_members_selection';

  @override
  State<TeamMembersSelectionScreen> createState() =>
      _TeamMembersSelectionScreenState();
}

enum SingingCharacter { lafayette, jefferson, washington }

class _TeamMembersSelectionScreenState
    extends State<TeamMembersSelectionScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showTransferAlert(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: RichText(
          text: TextSpan(
              style: const TextStyle(
                  color: primaryText,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              children: <TextSpan>[
                const TextSpan(
                    text:
                        'Do you want to transfer ownership to Daisy Hansley '),
                TextSpan(
                    text: '@daisy',
                    style: const TextStyle(
                        color: secondaryColor, fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(
                            context, TeamMembersSelectionScreen.routeName);
                      }),
                const TextSpan(text: '?'),
              ]),
        ),
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
              Navigator.pushNamed(context, DisbandTeamScreen.routeName);
            },
            child: const Text('Transfer',
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
          'Solar Surfers',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.washington,
                      groupValue: _character,
                      activeColor: primaryColor,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    const SizedBox(width: 2),
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kevin Durant',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Organizer',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ],
                ),
                horizontalTitleGap: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      activeColor: primaryColor,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    const SizedBox(width: 2),
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kevin Durant',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Organizer',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ],
                ),
                horizontalTitleGap: 0,
              ),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      activeColor: primaryColor,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    const SizedBox(width: 2),
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kevin Durant',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Organizer',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: secondaryTextColor),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ],
                ),
                horizontalTitleGap: 0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      _showTransferAlert(context);
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
                    child: const Text('Transfer'),
                  ),
                ),
              ),
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
