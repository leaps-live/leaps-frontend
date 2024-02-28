import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/community/filter_screen.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../landing/register_screen.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';

class CommunityTeams extends StatefulWidget {
  const CommunityTeams({super.key});
  static const routeName = '/community_teams';

  @override
  State<CommunityTeams> createState() => _CommunityTeamsState();
}

class _CommunityTeamsState extends State<CommunityTeams> {
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
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                        SizedBox(width: 10),
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
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.black26,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              height: 180,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/BasketballExample.jpg'),
                                ),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Solar Surfers',
                                    style: TextStyle(
                                        color: primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(children: [
                                    Column(
                                      children: [
                                        const Text(
                                          'PG',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: secondaryText),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 8),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              100), // Image border
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(
                                                17), // Image radius
                                            child: Image.network(
                                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        const Text(
                                          'SG',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: secondaryText),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 8),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              100), // Image border
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(
                                                17), // Image radius
                                            child: Image.network(
                                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        const Text(
                                          'SF',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: secondaryText),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 8),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              100), // Image border
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(
                                                17), // Image radius
                                            child: Image.network(
                                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        const Text(
                                          'PF',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: secondaryText),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 8),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              100), // Image border
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(
                                                17), // Image radius
                                            child: Container(
                                              color: tagColor,
                                              child: const Icon(
                                                Remix.add_fill,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        const Text(
                                          'C',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: secondaryText),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 8),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              100), // Image border
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(
                                                17), // Image radius
                                            child: Container(
                                              color: tagColor,
                                              child: const Icon(
                                                Remix.add_fill,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Hey everyone! Looking for two more players who are available on Sundays. Please join if you are interested. Thanks!',
                                    style: TextStyle(
                                        color: primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 80),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: basketball,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(16.0),
                                  bottomLeft: Radius.circular(16.0),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Remix.basketball_line,
                                          color: Colors.white,
                                          size: 23,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "Join Team",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Swipe for more cards",
                        style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
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
