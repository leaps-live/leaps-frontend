import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leaps_frontend/screens/league/createLeague/firstCreateLeague.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../utils/colors.dart';

class CreateLeagueScreen extends StatefulWidget {
  const CreateLeagueScreen({super.key});
  static const routeName = '/create_league';

  @override
  State<CreateLeagueScreen> createState() => _CreateLeagueScreenState();
}

class _CreateLeagueScreenState extends State<CreateLeagueScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedValue = "Category Choices";
  bool isLoading = false;
  bool areAllfieldsFilled = false;
  Map<String, dynamic> searchResult = {};

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _checkIfFieldFilled() {
    setState(() {
      areAllfieldsFilled = nameController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty &&
          selectedValue != "Category Choices";
    });
  }

  void createLeague() async {
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

    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    const String apiUrl = 'http://localhost:8080/leagues/register';

    // Create a map with the collected data
    final Map<String, dynamic> userData = {
      'leagueName': nameController.text,
      'leagueDescription': descriptionController.text,
      'leagueCategories': [selectedValue],
      'userId': userid,
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
        print(response.body);
        setState(() {
          searchResult = json.decode(response.body);
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('leagueid', searchResult['leagueid']);
        String? leagueid = prefs.getString('leagueid');
        print(leagueid);

        // var leagueName = nameController.text;

        var routeArguments = {
          "leagueName": nameController.text,
          "leagueid": leagueid,
        };

        Navigator.pushReplacementNamed(context, FirstCreateLeague.routeName,
            arguments: routeArguments);
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "The league name already exists",
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
          'Create a league',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              onChanged: (value) {
                _checkIfFieldFilled(); // Update button state on input change
              },
              decoration: const InputDecoration(
                labelText: 'League Name',
                hintText: 'League name',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            //category dropdown button

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
                  _checkIfFieldFilled();
                }
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

            TextField(
              controller: descriptionController,
              onChanged: (value) {
                _checkIfFieldFilled(); // Update button state on input change
              },
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Some description about this league',
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
                  createLeague();
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
