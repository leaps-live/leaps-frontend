import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  String selectedValue = "Category Choices";
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
          descriptionController.text.isNotEmpty &&
          selectedValue != "Category Choices";
    });
  }

  void createTeam() async {
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedValue == "Category Choices") {
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
      'teamCategories': [selectedValue],
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
      appBar: AppBar(
        title: const Text(
          'Create a team',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              ),
            ),
            const SizedBox(height: 46),
            const Text(
              'Category',
              style: TextStyle(fontSize: 17),
            ),
            DropdownButton<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedValue = newValue;
                  });
                }
                _checkIfFieldFilled(context);
              },
              items: <String>[
                'Category Choices',
                'Basketball',
                'Football',
                'Tennis',
                'Volleyball'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toSet()
                  .toList(), // 使用Set来确保唯一值
            ),
            const SizedBox(height: 26),
            TextField(
              controller: descriptionController,
              onChanged: (value) {
                _checkIfFieldFilled(
                    context); // Update button state on input change
              },
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Some description about this team',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              // maxLines: 3,
            ),
            const SizedBox(height: 400.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  createTeam();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      areAllfieldsFilled ? primaryColor : Colors.grey,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
          ],
        ),
      ),
    );
  }
}
