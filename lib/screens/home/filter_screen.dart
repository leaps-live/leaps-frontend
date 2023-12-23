import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static const routeName = '/filter_screen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        title: Text("Filter"),
        backgroundColor: secondaryBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 15),
          Text(
            "Sport",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Badminton",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Baseball",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red, // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Basketball",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Football",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Lacrosse",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Soccer",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Golf",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Volleyball",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, //  边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Tennis",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "+ Add More",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Location",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red, // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Seattle",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Days",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Weekdays",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red, // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Sunday",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Saturday",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Skill Level",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red, // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Beginner",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Intermediate",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Advanced",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 140),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                fixedSize: const Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Show Results',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
        ]),
      ),
    );
  }
}
