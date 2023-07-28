import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.face,
                  size: 80,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Container(child: const Icon(Icons.chat)),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // do something after clicking create button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: const Size(120, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Follow'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "LEAPS is The Best Livestreaming App",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  "1M Followers",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                      width: 2.0, // 边框宽度
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "5v5",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(75, 75, 75, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                      width: 2.0, // 边框宽度
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Seattle",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(75, 75, 75, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                      width: 2.0, // 边框宽度
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "UW",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(75, 75, 75, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Some team description here. leave space.",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
        ),
      ],
    );
  }
}
