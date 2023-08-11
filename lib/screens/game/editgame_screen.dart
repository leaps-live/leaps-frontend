import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens//search/searchMember_screen.dart';
import 'package:http/http.dart' as http;

class EditGameScreen extends StatefulWidget {
  const EditGameScreen({super.key});
  static const routeName = '/edit_game';

  @override
  State<EditGameScreen> createState() => _EditGameScreenState();
}

class _EditGameScreenState extends State<EditGameScreen> {
  String dropdownValue1 = "None";
  String dropdownValue2 = "None";
  bool isLoading = false;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String concatenatedDateTime = '';

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        _updateConcatenatedDateTime();
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        _updateConcatenatedDateTime();
      });
    }
  }

  void _updateConcatenatedDateTime() {
    if (selectedDate != null && selectedTime != null) {
      final DateTime combinedDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      concatenatedDateTime = combinedDateTime.toString();
    } else {
      concatenatedDateTime = '';
    }
  }

  void showPopup() {
    if (Theme.of(context).platform == TargetPlatform.android) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Do you want to delete this league?',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: const Text(
                'Team admins will be notified. This cannot be redone'),
            actions: [
              TextButton(
                onPressed: () {
                  deleteGame();
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
              'Do you want to delete this league?',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'Team admins will be notified. This cannot be redone',
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
                  deleteGame();
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

  void deleteGame() async {
    setState(() {
      isLoading = true;
    });

    String gameid = "85627481-9197-4d10-b55c-650414511f2b";

    try {
      final response =
          await http.delete(Uri.parse('http://localhost:8080/game/$gameid'));
      print(response.body);

      if (response.statusCode == 200) {
        print("Game deleted successfully");
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
          'Edit a Game',
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
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule: $concatenatedDateTime',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _selectDate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Select Date'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _selectTime,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Select Time'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Add Members',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SearchMemberScreen.routeName);
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: DropdownButton<String>(
                        value: dropdownValue1, // default option shown
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'None',
                            child: Text('None'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Home',
                            child: Text('Home'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Away',
                            child: Text('Away'),
                          ),
                        ],
                        onChanged: (String? value) {
                          // 处理选择的值

                          setState(() {
                            dropdownValue1 = value!; // 更新选择的值
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: DropdownButton<String>(
                        value: dropdownValue2, // default option shown
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'None',
                            child: Text('None'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Home',
                            child: Text('Home'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Away',
                            child: Text('Away'),
                          ),
                        ],
                        onChanged: (String? value) {
                          // 处理选择的值

                          setState(() {
                            dropdownValue2 = value!; // 更新选择的值
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Game Description',
                hintText: 'Some description about this game',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Number of Quarters',
                // border: InputBorder.none,
                hintText: 'Number Only',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Minutes per Quarters',
                // border: InputBorder.none,
                hintText: 'Number only',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 70.0),
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
                          Text('Delete this league',
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
                        'Delete this league',
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
