import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/user/editprofile_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:leaps_frontend/widgets/nav_drawer.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user';
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: backgroundColor,
            title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.menu, color: Colors.black, size: 30),
                  Icon(Icons.qr_code_scanner, color: Colors.black, size: 30)
                ])),
        body: ListView(
          children: const [HeroBar()],
        ));
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Ruov',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    textAlign: TextAlign.left,
                  )
                ])
              ]),
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  },
                  icon: const Icon(Icons.edit_square,
                      size: 21.0, color: Colors.black),
                  label: const Text('Edit Profile',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings,
                      size: 21.0, color: Colors.black),
                  label: const Text('Settings',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
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
                      size: 21.0, color: Colors.black),
                  label: const Text('Coins',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.wallet, size: 21.0, color: Colors.black),
                  label: const Text('Wallet',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.history,
                      size: 21.0, color: Colors.black),
                  label: const Text('Watch History',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite,
                      size: 21.0, color: Colors.black),
                  label: const Text('Likes',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.comment,
                      size: 21.0, color: Colors.black),
                  label: const Text('Comments',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center)),
              const SizedBox(height: 10),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download,
                      size: 21.0, color: Colors.black),
                  label: const Text('Downloads',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.center))
            ],
          ),
        ),
      ],
    );
  }
}
