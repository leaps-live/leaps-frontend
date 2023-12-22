import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';

class HomeTeam extends StatefulWidget {
  const HomeTeam({super.key});
  static const routeName = '/home';

  @override
  State<HomeTeam> createState() => _HomeTeamState();
}

class _HomeTeamState extends State<HomeTeam> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    if (userJsonString != null) {
      setState(() {
        isLogin = true;
      });
    }
  }

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
                "Team Recruitment(12)",
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
                        color: basketball,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15.0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Remix.basketball_line, color: Colors.white),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Basketball",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Remix.calendar_2_line, color: Colors.white),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Sundays",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Remix.map_pin_line, color: Colors.white),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UW Intramural Activities Building (IMA)",
                                style: TextStyle(
                                  color: Colors.white,
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
                        const Row(
                          children: [
                            Icon(Remix.user_2_line),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Kevin Durant"),
                            Spacer(),
                            Text("Shooting Guard")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(Remix.user_2_line),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Kevin Durant"),
                            Spacer(),
                            Text("Small Foward")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(Remix.user_2_line),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Kevin Durant"),
                            Spacer(),
                            Text("Power Forward")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(Remix.user_2_line),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Kevin Durant"),
                            Spacer(),
                            Text("Center")
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Note"),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            "Hey everyone! Looking for two more 🏀 players who are available on Sundays. Please join if you are interested. Thanks!"),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isLogin ? basketball : Colors.grey,
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Join team',
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
