import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const routeName = '/edit_profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String, dynamic> searchResult = {};
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController feetController = TextEditingController();
  final TextEditingController inchController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    searchResult = {};
    var apiUrl = Uri.parse('http://localhost:8080/users/$userid');
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        setState(() {
          searchResult = json.decode(response.body);
        });
        print(searchResult);
        birthdayController.text = searchResult['userbirthday'];
        weightController.text = searchResult['userweight'];
        feetController.text = searchResult['userheight'].split("'")[0];
        inchController.text = searchResult['userheight'].split("'")[1];
        print(response.body);
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
  void dispose() {
    // Dispose the controllers to free up resources
    birthdayController.dispose();
    feetController.dispose();
    inchController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void editProfile() async {
    if (birthdayController.text.isEmpty ||
        feetController.text.isEmpty ||
        inchController.text.isEmpty ||
        weightController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please fill in all fields!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    int? feetValue = int.tryParse(feetController.text);
    int? inchValue = int.tryParse(inchController.text);
    if (feetValue! < 0 || feetValue > 7 || inchValue! < 0 || inchValue > 12) {
      Fluttertoast.showToast(
        msg: "Please enter a valid height!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
      return;
    }

    // Get the input values from the text fields
    String birthday = birthdayController.text;
    String height = feetController.text + "'" + inchController.text;
    String weight = weightController.text;
    print(height);

    String userid = 'f7a0ab13-1573-4716-9423-95d02b8d6732';

    // Define the API endpoint URL
    String apiUrl = 'http://localhost:8080/users/put/$userid';

    // Create the request body
    Map<String, dynamic> requestBody = {
      'userBirthday': birthday,
      'userHeight': height,
      'userWeight': weight,
    };

    print(requestBody);

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        body: json.encode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Profile updated successfully
        print('Profile updated successfully!');

        Fluttertoast.showToast(
          msg: "Profile updated successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
        );

        Navigator.pop(context);
      } else {
        print('Error updating profile: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while updating profile: $e');
    }
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        birthdayController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _showCupertinoDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 200.0,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumYear: 1900,
            maximumYear: 2100,
            onDateTimeChanged: (DateTime newDate) {
              birthdayController.text =
                  DateFormat('yyyy-MM-dd').format(newDate);
            },
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        birthdayController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              actions: [
                TextButton(
                  onPressed: () {
                    editProfile();
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Avatar",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Icon(
                    Icons.account_circle,
                    size: 80,
                  ),
                  TextField(
                      controller: birthdayController,
                      decoration: const InputDecoration(
                        labelText: 'Birthday',
                        hintText: 'Birthday',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        if (Theme.of(context).platform == TargetPlatform.iOS) {
                          _showCupertinoDatePicker(context);
                        } else {
                          _showDatePicker(context);
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: feetController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Height (feet)',
                            hintText: 'Height (feet)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextField(
                          controller: inchController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Height (inch)',
                            hintText: 'Height (inch)',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Weight',
                      hintText: 'Weight',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
