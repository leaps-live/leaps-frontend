import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/colors.dart';

class Index extends StatefulWidget {
  final Map<String, dynamic> searchResult;
  const Index({Key? key, required this.searchResult}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    IconButton(
                      icon: const Icon(Remix.message_3_line,
                          color: Color(0xFF2E3A59)),
                      onPressed: () {},
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
            Text(
              widget.searchResult['teamname'] ?? 'Team Name',
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
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
                for (var category
                    in widget.searchResult['teamcategories'] ?? [])
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                            width: 2.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          category,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(75, 75, 75, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      )
                    ],
                  ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.searchResult['teamdescription'] ?? "some description",
              style: const TextStyle(
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
