import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:remixicon/remixicon.dart';

class CreateGameScreen extends StatefulWidget {
  const CreateGameScreen({super.key});
  static const routeName = '/create_game';

  @override
  State<CreateGameScreen> createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  String dropdownValue1 = "None";
  String dropdownValue2 = "None";

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String concatenatedDateTime = '';

  Future<void> _selectDate() async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 2100,
              backgroundColor: Colors.white,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  selectedDate = newDateTime;
                  _updateConcatenatedDateTime();
                });
              },
            ),
          );
        },
      );
    } else {
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
  }

  Future<void> _selectTime() async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      final TimeOfDay? pickedTime = await showCupertinoModalPopup<TimeOfDay>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              backgroundColor: Colors.white,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  selectedTime = TimeOfDay.fromDateTime(newDateTime);
                  _updateConcatenatedDateTime();
                });
              },
            ),
          );
        },
      );
    } else {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Text("Cancel", style: TextStyle(fontSize: 16)),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
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
            Text(
              'Schedule: $concatenatedDateTime',
              // 'Schedule: $concatenatedDateTime',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
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
                  child: Container(
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
              child: const Icon(
                Remix.add_circle_line,
                size: 40,
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
                labelText: 'Number of Quarters',
                // border: InputBorder.none,
                hintText: 'Number Only',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
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
            const SizedBox(height: 70.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // do something after clicking create button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
