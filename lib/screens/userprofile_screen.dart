import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user';
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView(
          children: const [HeroBar()],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.black, size: 30),
              Icon(Icons.qr_code_scanner, color: Colors.black, size: 30)
            ]));
  }
}

class HeroBar extends StatelessWidget {
  const HeroBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          width: MediaQuery.of(context).size.width * 0.90,
          // height: 230,
          decoration: ShapeDecoration(
            color: const Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.25, color: Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/id/237/200/300'),
                ),
                Column(children: [
                  Text(
                    'Ruolin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Ruov',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.left,
                  )
                ])
              ]),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_square,
                      size: 25.0, color: Colors.black),
                  label: const Text('Edit Profile',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 25.0, color: Colors.black),
                  label: const Text('Settings',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center))
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: ShapeDecoration(
            color: const Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.25, color: Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_square,
                      size: 25.0, color: Colors.black),
                  label: const Text('Coins',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 25.0, color: Colors.black),
                  label: const Text('Wallet',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 25.0, color: Colors.black),
                  label: const Text('Watch History',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 25.0, color: Colors.black),
                  label: const Text('Likes',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 25.0, color: Colors.black),
                  label: const Text('Comments',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 25.0, color: Colors.black),
                  label: const Text('Downloads',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                          color: Colors.black),
                      textAlign: TextAlign.center))
            ],
          ),
        ),
      ],
    );
  }
}
