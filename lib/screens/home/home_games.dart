import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import '../../utils/colors.dart';

class HomeGames extends StatefulWidget {
  const HomeGames({super.key});
  static const routeName = '/home_games';

  @override
  State<HomeGames> createState() => _HomeGamesState();
}

class _HomeGamesState extends State<HomeGames> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Game Recruitment(12)",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Remix.equalizer_line,
                  color: Color(0xFF2E3A59),
                ),
              ),
              Text("Filter", style: TextStyle(fontSize: 19))
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Beginner",
                  style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                    width: 2.0, // 边框宽度
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "men",
                  style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(3.0),
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
                      fontSize: 13,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.0, // 设置阴影
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: tennis,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15.0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Remix.basketball_line, color: Colors.black),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Basketball",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Remix.calendar_2_line, color: Colors.black),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sundays",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Remix.map_pin_line, color: Colors.black),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UW Intramural Activities Building (IMA)",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Team 1"),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Remix.user_2_line),
                            Icon(Remix.user_2_line),
                            Icon(Remix.user_2_line),
                            Icon(Remix.user_2_line),
                            Icon(Remix.user_2_line),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Note"),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            "Hey everyone! Looking for two more 🏀 players who are available on Sundays. Please join if you are interested. Thanks!"),
                        const SizedBox(
                          height: 120,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tennis,
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Join pickup',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
