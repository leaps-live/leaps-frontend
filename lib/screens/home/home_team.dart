import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/home/filter_screen.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../landing/register_screen.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';

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
    final widthRatio = MediaQuery.of(context).size.width;
    final heightRatio = MediaQuery.of(context).size.height;

    final pageHeadingStyle = TextStyle(
      fontSize: 0.04 * widthRatio,
      fontWeight: FontWeight.w600,
      color: secondaryTextColor,
    );

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, FilterScreen.routeName);
                            },
                            icon: Icon(
                              RemixIcon.equalizer_2_line,
                              color: Color(0xFF2E3A59),
                            ),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'Filter',
                                  style: pageHeadingStyle,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, FilterScreen.routeName);
                                    })),
                          SizedBox(width: 10),
                          Text(
                            "•",
                            style: pageHeadingStyle,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "12 Results",
                            style: pageHeadingStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 0),
                    SizedBox(
                      width: widthRatio,
                      child: SingleChildScrollView(
                        //ADDITION
                        scrollDirection: Axis.vertical,
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
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15.0)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Remix.basketball_line,
                                              color: Colors.white),
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
                                          Icon(Remix.calendar_2_line,
                                              color: Colors.white),
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
                                          Icon(Remix.map_pin_line,
                                              color: Colors.white),
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
                                          backgroundColor: isLogin
                                              ? basketball
                                              : Colors.grey,
                                          fixedSize: const Size(150, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          elevation: 0.0,
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: const Text('Join team',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.01 * heightRatio,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
