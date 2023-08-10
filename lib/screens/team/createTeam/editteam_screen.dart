import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';

class EditTeamScreen extends StatefulWidget {
  const EditTeamScreen({super.key});
  static const routeName = '/edit_team';

  @override
  State<EditTeamScreen> createState() => _EditTeamScreenState();
}

class _EditTeamScreenState extends State<EditTeamScreen> {
  String selectedValue = "Category Choices";
  bool isLoading = false;

  void showPopup() {
    if (Theme.of(context).platform == TargetPlatform.android) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Do you want to delete this team?',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content:
                const Text('Players will be notified. This cannot be redone'),
            actions: [
              TextButton(
                onPressed: () {
                  deleteTeam();
                  Navigator.of(context).pop();
                },
                child: const Text('Yes, delete'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xFF747474)),
                ),
              ),
            ],
          );
        },
      );
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(
              'Do you want to delete this team?',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'Players will be notified. This cannot be redone',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel',
                    style: TextStyle(color: Color(0xFF747474))),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  deleteTeam();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Yes, delete',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void deleteTeam() async {
    setState(() {
      isLoading = true;
    });

    String teamid = "073a7296-7807-4021-8123-fa930cfa6ca3";

    try {
      final response =
          await http.delete(Uri.parse('http://localhost:8080/team/$teamid'));
      print(response.body);

      if (response.statusCode == 200) {
        print("Team deleted successfully");
      }
    } catch (e) {
      print(e);
    } finally {
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
          'Edit a Team',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Team Name',
                // border: InputBorder.none,
                hintText: 'Team name',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
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
                // _checkIfFieldFilled();
              },
              items: <String>[
                'Category Choices',
                'basketball',
                'football',
                'tennis',
                'volleyball'
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Some description about this team',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              // maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Team Members',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, routeName)
                    },
                    child: const Text(
                      "View List",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 17),
                    ))
              ],
            ),
            const SizedBox(height: 240.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showPopup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: isLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Delete this team',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)),
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
                    : const Text(
                        'Delete this team',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
