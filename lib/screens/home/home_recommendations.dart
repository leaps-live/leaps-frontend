import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import '../../utils/colors.dart';

class HomeRecommendations extends StatefulWidget {
  const HomeRecommendations({super.key});
  static const routeName = '/home';

  @override
  State<HomeRecommendations> createState() => _HomeRecommendationsState();
}

class _HomeRecommendationsState extends State<HomeRecommendations> {
  // final List<String> imageUrls = [
  //   "assets/images/swiper1.jpg",
  //   "assets/images/swiper2.jpeg",
  //   "assets/images/swiper3.jpg",
  // ];

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
                child: Text(
                  "Seattle",
                  style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(75, 75, 75, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Card(
              elevation: 1, // shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // 圆角大小
              ),
              child: Container(
                  padding: EdgeInsets.all(16), // 内边距
                  child: Column(
                    children: [
                      Container(
                        color: basketball,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Remix.basketball_line),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Basketball")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Remix.calendar_2_line),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Sundays")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Remix.map_pin_line),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("UW Intramural Activities Building (IMA)")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Remix.user_2_line),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Kevin Durant"),
                          Spacer(),
                          Text("Point Guard")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
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
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: basketball,
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
                  )),
            ),
          )
        ],
      ),
    );
  }
}
