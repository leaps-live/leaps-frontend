import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});
  static const routeName = '/team';

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teams",
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
              const Text(
                "1M Followers",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(75, 75, 75, 1),
                    fontWeight: FontWeight.bold),
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
                                      "Title of the video",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Icon(Icons.unfold_more)
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
                                      "Title of the video",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Icon(Icons.unfold_more)
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
                                    "Title of the video",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Icon(Icons.unfold_more)
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
                                    "Title of the video",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Icon(Icons.unfold_more)
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
