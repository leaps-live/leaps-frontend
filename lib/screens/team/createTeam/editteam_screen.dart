import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';

class EditTeamScreen extends StatefulWidget {
  const EditTeamScreen({super.key});
  static const routeName = '/edit_team';

  @override
  State<EditTeamScreen> createState() => _EditTeamScreenState();
}

class _EditTeamScreenState extends State<EditTeamScreen> {
  String selectedValue = "Category Choices";

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
            )
          ],
        ),
      ),
    );
  }
}
