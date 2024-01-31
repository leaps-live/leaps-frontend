import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:intl/intl.dart';

class CreateGameTwoScreen extends StatefulWidget {
  const CreateGameTwoScreen({super.key});
  static const routeName = '/create_game_two';

  @override
  State<CreateGameTwoScreen> createState() => _CreateGameTwoScreenState();
}

class _CreateGameTwoScreenState extends State<CreateGameTwoScreen> {
  String dropdownValue1 = "None";
  String dropdownValue2 = "None";

  // TODO: https://www.youtube.com/watch?v=uL09CPiM8Ds

  DateTime dateTime = DateTime.now();
  DateTime justTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Create a Game',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Team",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100), // Image border
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(15), // Image radius
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Mighty Dragons',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Opponent Team',
              // 'Schedule: $concatenatedDateTime',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: const Icon(
                Remix.search_line,
                color: Color(0xFF2E3A59),
              ),
              onTap: () {
                Navigator.pushNamed(context, SearchMemberScreen.routeName);
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Location',
              // 'Schedule: $concatenatedDateTime',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: tagColor,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              child: const Text("Select Location",
                  style: TextStyle(
                      color: secondaryTextColor, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Date and Time:',
              // 'Schedule: $concatenatedDateTime',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              height: 250,
                              child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  initialDateTime: dateTime,
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() => dateTime = newTime);
                                  },
                                  use24hFormat: true,
                                  mode: CupertinoDatePickerMode.date),
                            ))
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tagColor,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12)),
                  child: Text(
                      '${dateTime.month}-${dateTime.day}-${dateTime.year}',
                      style: const TextStyle(
                          color: secondaryTextColor,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                              height: 250,
                              child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  initialDateTime: justTime,
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() => justTime = newTime);
                                  },
                                  use24hFormat: true,
                                  mode: CupertinoDatePickerMode.time),
                            ))
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tagColor,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12)),
                  child: Text(
                    '${justTime.hour}:${justTime.minute}',
                    style: TextStyle(
                        color: secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Number of Quarters',
              // 'Schedule: $concatenatedDateTime',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: tagColor,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12)),
              child: const Text("1",
                  style: TextStyle(
                      color: secondaryTextColor, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Minutes per Quarter',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: tagColor,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12)),
              child: const Text("1",
                  style: TextStyle(
                      color: secondaryTextColor, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // do something after clicking create button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: const Size(300, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}
