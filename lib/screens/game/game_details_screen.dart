import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:intl/intl.dart';

class GameDetailsScreen extends StatefulWidget {
  const GameDetailsScreen({super.key});
  static const routeName = '/game_details';

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Upcoming Game',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              // height: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.black26,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: basketball,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Remix.basketball_fill,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Tuesday, March 5",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  Remix.arrow_right_s_line,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(
                              Remix.time_line,
                              color: primaryText,
                            ),
                            SizedBox(width: 12),
                            Text(
                              '10:00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            )
                          ]),
                          SizedBox(height: 15),
                          SizedBox(
                            child: Row(children: [
                              Icon(
                                Remix.map_pin_2_line,
                                color: primaryText,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'UW IMA (Intramural Activities Building)',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
