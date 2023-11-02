import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/user/editprofile_screen.dart';
import 'package:leaps_frontend/screens/user/settings/settings_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CareerProfileScreen extends StatefulWidget {
  static const routeName = '/careerprofile';
  const CareerProfileScreen({super.key});

  @override
  State<CareerProfileScreen> createState() => _CareerProfileScreenState();
}

class _CareerProfileScreenState extends State<CareerProfileScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
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
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text("Ruolin Chen"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Remix.share_circle_line,
                  color: Color(0xFF2E3A59),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
              ),
            ]),
        body: isLogin
            ? ListView(
                children: const [
                  SizedBox(height: 10),
                  HeroContent(),
                  SizedBox(height: 10),
                  Highlight(),
                  ExperienceWidget()
                ],
              )
            : const Center(
                child: Text("Please login first"),
              ));
  }
}

class HeroContent extends StatefulWidget {
  const HeroContent({super.key});

  @override
  State<HeroContent> createState() => _HeroContentState();
}

class _HeroContentState extends State<HeroContent> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          // padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(''),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, EditProfile.routeName);
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "@ruov",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "19 yr",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "6'2",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                        width: 1.0, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Seattle, WA",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFEFE),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "PTS",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 81, 81, 81)),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "124",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "REB",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 81, 81, 81)),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "39",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "AST",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 81, 81, 81)),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "56",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "GP",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 81, 81, 81)),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "20",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Highlight extends StatefulWidget {
  const Highlight({super.key});

  @override
  State<Highlight> createState() => _HighlightState();
}

class _HighlightState extends State<Highlight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Row(
            children: [
              Text("Highlights",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black)),
              Spacer(),
              Text("View all",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    color: Colors.grey,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    color: Colors.grey,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
        ],
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Experience",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black)),
          const SizedBox(height: 5),
          const Center(
              child: Text("Recent",
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 75,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                      width: 2.5,
                    ),
                    color: const Color(0xFFFEFEFE),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(100), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(23), // Image radius
                            child: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Point Guard',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Mighty Dragons',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ])),
            ],
          ),
          const SizedBox(height: 20),
          const Center(
              child: Text("2022",
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 75,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFEFE),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(100), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(23), // Image radius
                            child: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Point Guard',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Mighty Dragons',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'PTS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '20.0',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ])),
            ],
          ),
        ],
      ),
    );
  }
}
