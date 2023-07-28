import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});
  static const routeName = '/league';

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Leagues",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          GestureDetector(
            child: const Icon(Icons.share),
            onTap: () {},
          )
        ],
      ),
      body: Column(
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
          Expanded(
            child: Card(
              color: Colors.grey[200], // 设置Card的背景颜色为浅灰色
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Videos",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text("Game Schedule",
                              style: TextStyle(
                                fontSize: 17,
                              )),
                          Text("Members",
                              style: TextStyle(
                                fontSize: 17,
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: screenWidth / 2 - 25,
                                  color: Colors.grey,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Team A",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "23",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Team B",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "17",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: screenWidth / 2 - 25,
                                  color: Colors.grey,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Team A",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "23",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Team B",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "17",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 100,
                                width: screenWidth / 2 - 25,
                                color: Colors.grey,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Team A",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "23",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Team B",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "17",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 100,
                                width: screenWidth / 2 - 25,
                                color: Colors.grey,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Team A",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "23",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Team B",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    "17",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
