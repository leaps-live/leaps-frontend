import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/team/createTeam/createteam_steptwo_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/firstCreateTeam.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});
  static const routeName = '/create_team';

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<String> selectedSport = <String>[
    'Basketball',
    'Football',
    'Soccer',
    'Baseball',
    'Volleyball',
    'Hiking',
  ];
  int selectedSportIndex = 0;
  String teamid = "";
  bool areAllfieldsFilled = false;
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _checkIfFieldFilled(BuildContext context) {
    setState(() {
      areAllfieldsFilled = nameController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty;
    });
  }

  void createTeam() async {
    if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fulfill all the fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    // Navigator.pushReplacementNamed(context, FirstCreateTeam.routeName);

    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    const String apiUrl = 'http://localhost:8080/team/create';

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      // TODO: change teamCategories to teamSport
      'teamCategories': [selectedSport[selectedSportIndex]],
      'teamName': nameController.text,
      'teamDescription': descriptionController.text,
      'teamCreator': userid,
    };

    print(userData);

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Successfully sent data to the backend
        print('Data sent successfully!');
        setState(() {
          teamid = json.decode(response.body);
        });
        print("teamid: $teamid");

        var routeArguments = {
          "teamName": nameController.text,
          "teamid": teamid,
        };

        Navigator.pushNamed(context, FirstCreateTeam.routeName,
                arguments: routeArguments)
            .then((result) {
          if (result != null && result is bool && result) {
            if (mounted) {
              Navigator.pop(context, true);
            }
          }
        });
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "The team name already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );
      } else {
        // Error handling if the request fails
        print('Failed to send data. Error code: ${response.statusCode}');
        // print(response);
      }
    } catch (e) {
      print('Error occurred while sending data: $e');
    } finally {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Create a team',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: secondaryBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40), // Image radius
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              onChanged: (value) {
                _checkIfFieldFilled(
                    context); // Update button state on input change
              },
              decoration: const InputDecoration(
                labelText: 'Team Name',
                // border: InputBorder.none,
                hintText: 'Team name',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 26),
            TextField(
              controller: descriptionController,
              onChanged: (value) {
                _checkIfFieldFilled(
                    context); // Update button state on input change
              },
              decoration: const InputDecoration(
                labelText: 'Team Description (optional)',
                hintText: 'Team Description (optional)',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
              // maxLines: 3,
            ),
            const SizedBox(height: 26),
            const Text(
              'Sport',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 8),
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
                              selectedSportIndex = value;
                            });
                          },
                          children: const [
                            Text('Basketball'),
                            Text('Football'),
                            Text('Soccer'),
                            Text('Baseball'),
                            Text('Volleyball'),
                            Text('Hiking'),
                          ],
                        )))
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: tagColor,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12)),
              child: Text(selectedSport[selectedSportIndex],
                  style: const TextStyle(
                      color: secondaryTextColor, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // createTeam();
                    Navigator.pushReplacementNamed(
                        context, CreateTeamStepTwoScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        areAllfieldsFilled ? primaryColor : Colors.grey,
                    fixedSize: const Size(300, 43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  child: isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Create'),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          ],
                        )
                      : const Text('Create'),
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
