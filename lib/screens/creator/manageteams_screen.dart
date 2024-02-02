import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';
import 'package:intl/intl.dart';

class ManageTeamsScreen extends StatefulWidget {
  const ManageTeamsScreen({super.key});
  static const routeName = '/manage_teams';

  @override
  State<ManageTeamsScreen> createState() => _ManageTeamsScreenState();
}

class _ManageTeamsScreenState extends State<ManageTeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryBackgroundColor,
        title: const Text(
          'Manage Teams',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: basketball,
                width: double.infinity,
                height: 33,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Basketball",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(100), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(20), // Image radius
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Mighty Dragons',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(100), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(20), // Image radius
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Mighty Dragons',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(100), // Image border
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(20), // Image radius
                          child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Mighty Dragons',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
