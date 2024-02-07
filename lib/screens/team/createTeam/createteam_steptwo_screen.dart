import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/creator/creatorcenter_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class CreateTeamStepTwoScreen extends StatefulWidget {
  const CreateTeamStepTwoScreen({super.key});
  static const routeName = '/create_team_step_two';

  @override
  State<CreateTeamStepTwoScreen> createState() =>
      _CreateTeamStepTwoScreenState();
}

class _CreateTeamStepTwoScreenState extends State<CreateTeamStepTwoScreen> {
  final List<String> selectedPositions = <String>[
    'Captain',
    'Player',
    'Coach',
  ];
  int selectedPositionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Solar Surfers',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: secondaryBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, CreateCenterScreen.routeName);
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  color: primaryText,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Remix.add_circle_line,
                      color: secondaryColor, size: 30),
                  onPressed: () {},
                ),
                const SizedBox(width: 15),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      'Add Members',
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
            const SizedBox(height: 15),
            Row(children: [
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mighty Dragons',
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
              ]),
              const Spacer(),
              ElevatedButton(
                onPressed: () => {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            itemExtent: 30,
                            scrollController:
                                FixedExtentScrollController(initialItem: 0),
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                selectedPositionIndex = value;
                              });
                            },
                            children: const [
                              Text('Captain'),
                              Text('Player'),
                              Text('Coach'),
                            ],
                          )))
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12)),
                child: Row(
                  children: [
                    Text(selectedPositions[selectedPositionIndex],
                        style: const TextStyle(
                            color: primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    const SizedBox(width: 10),
                    const Icon(Remix.arrow_down_s_fill,
                        color: primaryText, size: 16)
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 15),
            Row(children: [
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mighty Dragons',
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
              ]),
              const Spacer(),
              ElevatedButton(
                onPressed: () => {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            itemExtent: 30,
                            scrollController:
                                FixedExtentScrollController(initialItem: 0),
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                selectedPositionIndex = value;
                              });
                            },
                            children: const [
                              Text('Captain'),
                              Text('Player'),
                              Text('Coach'),
                            ],
                          )))
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12)),
                child: Row(
                  children: [
                    Text(selectedPositions[selectedPositionIndex],
                        style: const TextStyle(
                            color: primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    const SizedBox(width: 10),
                    const Icon(Remix.arrow_down_s_fill,
                        color: primaryText, size: 16)
                  ],
                ),
              ),
            ]),
            SizedBox(height: 15),
            Row(children: [
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mighty Dragons',
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
              ]),
              const Spacer(),
              ElevatedButton(
                onPressed: () => {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            itemExtent: 30,
                            scrollController:
                                FixedExtentScrollController(initialItem: 0),
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                selectedPositionIndex = value;
                              });
                            },
                            children: const [
                              Text('Captain'),
                              Text('Player'),
                              Text('Coach'),
                            ],
                          )))
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12)),
                child: Row(
                  children: [
                    Text(selectedPositions[selectedPositionIndex],
                        style: const TextStyle(
                            color: primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    const SizedBox(width: 10),
                    const Icon(Remix.arrow_down_s_fill,
                        color: primaryText, size: 16)
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
