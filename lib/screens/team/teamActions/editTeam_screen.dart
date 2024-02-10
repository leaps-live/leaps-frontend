import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class EditTeamScreen extends StatefulWidget {
  // final Map<String, dynamic> searchResult;

  // const EditTeamScreen({Key? key, required this.searchResult})
  //     : super(key: key);

  const EditTeamScreen({super.key});

  static const routeName = '/edit_team';

  @override
  State<EditTeamScreen> createState() => _EditTeamScreenState();
}

class _EditTeamScreenState extends State<EditTeamScreen> {
  String selectedValue = "Category Choices";
  bool isLoading = false;
  bool saveLoading = false;
  bool areAllfieldsFilled = false;
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // print(widget.searchResult);
    // teamNameController.text = widget.searchResult['teamname'];
    // descriptionController.text = widget.searchResult['teamdescription'];
    // selectedValue =
    //     widget.searchResult['teamcategories'][0] ?? "Category Choices";
  }

  @override
  void dispose() {
    teamNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _checkIfFieldFilled(BuildContext context) {
    setState(() {
      areAllfieldsFilled = teamNameController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty;
    });
  }
  // void showPopup(BuildContext context) {
  //   if (Theme.of(context).platform == TargetPlatform.android) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text(
  //             'Do you want to delete this team?',
  //             style:
  //                 TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
  //           ),
  //           content:
  //               const Text('Players will be notified. This cannot be redone'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 deleteTeam();
  //                 Fluttertoast.showToast(
  //                   msg: "Team deleted successfully",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   gravity: ToastGravity.CENTER,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.grey,
  //                   textColor: Colors.white,
  //                 );
  //                 Navigator.pushNamedAndRemoveUntil(
  //                     context, MainScreen.routeName, (route) => false);
  //               },
  //               child: const Text('Yes, delete'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text(
  //                 'Cancel',
  //                 style: TextStyle(color: Color(0xFF747474)),
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else if (Theme.of(context).platform == TargetPlatform.iOS) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return CupertinoAlertDialog(
  //           title: const Text(
  //             'Do you want to delete this team?',
  //             textAlign: TextAlign.start,
  //             style: TextStyle(fontWeight: FontWeight.w600),
  //           ),
  //           content: const Text(
  //             'Players will be notified. This cannot be redone',
  //             style: TextStyle(fontSize: 15),
  //             textAlign: TextAlign.start,
  //           ),
  //           actions: [
  //             CupertinoDialogAction(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Cancel',
  //                   style: TextStyle(color: Color(0xFF747474))),
  //             ),
  //             CupertinoDialogAction(
  //               onPressed: () {
  //                 deleteTeam();
  //                 Fluttertoast.showToast(
  //                   msg: "Team deleted successfully",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   gravity: ToastGravity.CENTER,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.grey,
  //                   textColor: Colors.white,
  //                 );
  //                 Navigator.pushNamedAndRemoveUntil(
  //                     context, MainScreen.routeName, (route) => false);
  //               },
  //               child: const Text(
  //                 'Yes, delete',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.w600, color: Colors.black),
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // void deleteTeam() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   String teamid = widget.searchResult['teamid'];
  //   print("teamid: $teamid");

  //   try {
  //     final response =
  //         await http.delete(Uri.parse('http://localhost:8080/team/$teamid'));
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       print("Team deleted successfully");
  //     }
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     if (!mounted) return;
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  // void saveChange(BuildContext context) async {
  //   setState(() {
  //     saveLoading = true;
  //   });

  //   final Map<String, dynamic> teamInfo = {
  //     'teamName': teamNameController.text,
  //     'teamDescription': descriptionController.text,
  //   };

  //   String teamid = widget.searchResult['teamid'];
  //   print("teamid: $teamid");

  //   final apiUrl = 'http://localhost:8080/team//update/$teamid';

  //   try {
  //     final response = await http.put(
  //       Uri.parse(apiUrl),
  //       body: json.encode(teamInfo),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       print("Team updated successfully");
  //       Fluttertoast.showToast(
  //         msg: "Team updated successfully",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.grey,
  //         textColor: Colors.white,
  //       );

  //       Navigator.pop(context);
  //     }
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     setState(() {
  //       saveLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Edit Team',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {
              // saveChange(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color.fromARGB(255, 8, 125, 221),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
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
              controller: teamNameController,
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
            const SizedBox(height: 40),
            const Text(
              "More Actions",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12)),
                  child: const Row(
                    children: [
                      Text('All Members (3)',
                          style: TextStyle(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(
                        Remix.arrow_right_s_line,
                        color: secondaryTextColor,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12)),
                  child: const Row(
                    children: [
                      Text('Disband Team',
                          style: TextStyle(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600)),
                      Spacer(),
                      Icon(
                        Remix.arrow_right_s_line,
                        color: secondaryTextColor,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
