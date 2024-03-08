import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/createTeam/createTeam_stepOne_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';

class CreateTeamPreFiltersScreen extends StatefulWidget {
  const CreateTeamPreFiltersScreen({super.key});
  static const routeName = '/create_team_prefilters';

  @override
  State<CreateTeamPreFiltersScreen> createState() =>
      _CreateTeamPreFiltersScreenState();
}

class _CreateTeamPreFiltersScreenState
    extends State<CreateTeamPreFiltersScreen> {
  String selectedGender = "";
  String selectedLevel = "";
  String selectedSport = "Basketball";
  String selectedLocation = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        title: const Text("Create a team"),
        backgroundColor: secondaryBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 15),
          const Text(
            "Sport",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Row(children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Basketball",
                  style: const TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ]),
          SizedBox(height: 25),
          Text(
            "Location",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor, // 边框颜色
                      width: 1.0, // 边框宽度
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Green Lake Community Center",
                    style: const TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                      width: 1.0, // 边框宽度
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    size: 15,
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          // Select Days
          // SizedBox(height: 25),
          // Text(
          //   "Days",
          //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          // ),
          // SizedBox(height: 15),
          // Column(
          //   children: [
          //     Row(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               selectedDay = "Monday";
          //             });
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Monday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Color.fromRGBO(75, 75, 75, 1),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ),
          //         SizedBox(width: 15),
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               selectedDay = "Tuesday";
          //             });
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Tuesday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Color.fromRGBO(75, 75, 75, 1),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ),
          //         SizedBox(width: 15),
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               selectedDay = "Wednesday";
          //             });
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Wednesday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Color.fromRGBO(75, 75, 75, 1),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 15),
          //     Row(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               selectedDay = "Thursday";
          //             });
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Thursday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Color.fromRGBO(75, 75, 75, 1),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ),
          //         SizedBox(width: 15),
          //         GestureDetector(
          //           onTap: () {},
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Friday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Color.fromRGBO(75, 75, 75, 1),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ),
          //         SizedBox(width: 15),
          //         GestureDetector(
          //           onTap: () {},
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: primaryColor, // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Saturday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: primaryColor,
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 15),
          //     GestureDetector(
          //       onTap: () {},
          //       child: Row(
          //         children: [
          //           Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12.0, vertical: 3.7),
          //             decoration: BoxDecoration(
          //               border: Border.all(
          //                 color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
          //                 width: 1.0, // 边框宽度
          //               ),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Text(
          //               "Sunday",
          //               style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Color.fromRGBO(75, 75, 75, 1),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(height: 25),
          Text(
            "Skill Level (Optional)",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLevel = "Beginner";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: selectedLevel == "Beginner"
                      ? BoxDecoration(
                          border: Border.all(
                            color: primaryColor, // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            color:
                                const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                  child: Text(
                    "Beginner",
                    style: selectedLevel == "Beginner"
                        ? const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.normal)
                        : const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLevel = "Intermediate";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: selectedLevel == "Intermediate"
                      ? BoxDecoration(
                          border: Border.all(
                            color: primaryColor, // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            color:
                                const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                  child: Text(
                    "Intermediate",
                    style: selectedLevel == "Intermediate"
                        ? const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.normal)
                        : const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLevel = "Advanced";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: selectedLevel == "Advanced"
                      ? BoxDecoration(
                          border: Border.all(
                            color: primaryColor, // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            color:
                                const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                  child: Text(
                    "Advanced",
                    style: selectedLevel == "Advanced"
                        ? const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.normal)
                        : const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Gender (Optional)",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = "Male";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: selectedGender == "Male"
                      ? BoxDecoration(
                          border: Border.all(
                            color: primaryColor, // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            color:
                                const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                  child: Text(
                    "Male Only",
                    style: selectedGender == "Male"
                        ? const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.normal)
                        : const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = "Female";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 3.7),
                  decoration: selectedGender == "Female"
                      ? BoxDecoration(
                          border: Border.all(
                            color: primaryColor, // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            color:
                                const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                            width: 1.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                  child: Text(
                    "Female Only",
                    style: selectedGender == "Female"
                        ? const TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            fontWeight: FontWeight.normal)
                        : const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
          // TODO: Replace with align bottom screen
          const SizedBox(height: 100),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, CreateTeamStepOneScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: const Size(300, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text('Next',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 56,
          ),
        ]),
      ),
    );
  }
}
