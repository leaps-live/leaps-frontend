import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/team/createTeam/createTeam_stepOne_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';

class CreateTeamSteponeScreen extends StatefulWidget {
  const CreateTeamSteponeScreen({super.key});
  static const routeName = '/create_team_stepone';

  @override
  State<CreateTeamSteponeScreen> createState() =>
      _CreateTeamSteponeScreenState();
}

class _CreateTeamSteponeScreenState extends State<CreateTeamSteponeScreen> {
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
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Badminton",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Baseball",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor, // 边框颜色
                    width: 1.0, // 边框宽度
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
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Football",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Lacrosse",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Soccer",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Golf",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Volleyball",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, //  边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Tennis",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "+ More",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Location",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
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
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
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
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Days",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 3.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Monday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 3.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Tuesday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 3.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Wednesday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 3.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Thursday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 3.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Friday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
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
                      "Saturday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 3.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "Sunday",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Skill Level (Optional)",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor, // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Beginner",
                  style: const TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Intermediate",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Advanced",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor, // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Male only",
                  style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.7),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 1.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Female only",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          // TODO: Replace with align bottom screen
          const SizedBox(height: 100),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CreateTeamScreen.routeName);
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
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
            ),
          ),
        ]),
      ),
    );
  }
}
