import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class AnnouncementsHistoryScreen extends StatefulWidget {
  const AnnouncementsHistoryScreen({super.key});
  static const routeName = '/announcements_history';

  @override
  State<AnnouncementsHistoryScreen> createState() =>
      _AnnouncementsHistoryScreenState();
}

class _AnnouncementsHistoryScreenState extends State<AnnouncementsHistoryScreen>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Team Announcements',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: basketball, width: 1.0),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          13), // Image radius
                                      child: Image.network(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Jack Stanley',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text(
                                    'Coach',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: secondaryTextColor),
                                  )
                                ],
                              ),
                              const Icon(
                                Remix.pushpin_line,
                                color: basketball,
                                size: 18,
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          const Text(
                            "Hey everyone, don’t forget we have practice before the game on Monday night.",
                            style: TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          13), // Image radius
                                      child: Image.network(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Jack Stanley',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text(
                                    'Coach',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: secondaryTextColor),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          const Text(
                            "Hey everyone, don’t forget we have practice before the game on Monday night.",
                            style: TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 12),
                          const Text(
                            "January 2, 2024",
                            style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(
                                          13), // Image radius
                                      child: Image.network(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Jack Stanley',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(width: 3),
                                  const Text(
                                    'Coach',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: secondaryTextColor),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          const Text(
                            "Hey everyone, don’t forget we have practice before the game on Monday night.",
                            style: TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 12),
                          const Text(
                            "January 2, 2024",
                            style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
