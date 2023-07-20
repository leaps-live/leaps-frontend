import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});
  static const routeName = '/create_team';

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  String dropdownValue1 = "Default";
  String dropdownValue2 = "Default";
  String dropdownValue3 = "Default";
  String dropdownValue4 = "Default";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create a Team',
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
                            value: 'Default',
                            child: Text('Default'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Admin',
                            child: Text('Admin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Player',
                            child: Text('Player'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Coach',
                            child: Text('Coach'),
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
                            value: 'Default',
                            child: Text('Default'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Admin',
                            child: Text('Admin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Player',
                            child: Text('Player'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Coach',
                            child: Text('Coach'),
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
                        value: dropdownValue3, // default option shown
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'Default',
                            child: Text('Default'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Admin',
                            child: Text('Admin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Player',
                            child: Text('Player'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Coach',
                            child: Text('Coach'),
                          ),
                        ],
                        onChanged: (String? value) {
                          // 处理选择的值

                          setState(() {
                            dropdownValue3 = value!; // 更新选择的值
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
                        value: dropdownValue4, // default option shown
                        items: const <DropdownMenuItem<String>>[
                          DropdownMenuItem<String>(
                            value: 'Default',
                            child: Text('Default'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Admin',
                            child: Text('Admin'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Player',
                            child: Text('Player'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Coach',
                            child: Text('Coach'),
                          ),
                        ],
                        onChanged: (String? value) {
                          // 处理选择的值

                          setState(() {
                            dropdownValue4 = value!; // 更新选择的值
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
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
