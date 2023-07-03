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
          width: MediaQuery.of(context).size.width * 0.90,
          height: 230,
          decoration: ShapeDecoration(
            color: const Color(0xFFFEFEFE),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.25, color: Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 59,
                top: 139,
                child: Text(
                  'Edit Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF272727),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 186,
                child: Container(
                  width: 23,
                  height: 23,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2.40, vertical: 0.96),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // children: [
                    // ,
                    // ],
                  ),
                ),
              ),
              const Positioned(
                left: 59,
                top: 187,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Color(0xFF282828),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 138,
                child: Container(
                  width: 23,
                  height: 23,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 23,
                        height: 23,
                        // child: Stack(children: [
                        // ,
                        // ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
