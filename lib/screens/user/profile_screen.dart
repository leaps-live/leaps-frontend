import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/landing/login_screen.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/user/editprofile_screen.dart';
import 'package:leaps_frontend/screens/user/settings/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';

class User {
  String userid;
  String firstName;
  String lastName;

  User({required this.userid, required this.firstName, required this.lastName});

  // Convert User object to Map
  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'userfirstname': firstName,
      'userlastname': lastName
    };
  }

  // Create User object from Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['userid'],
      firstName: json['userfirstname'],
      lastName: json['userlastname'],
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // set different pages for guest and user
  bool isLogin = false;

  // add loading effect for initState
  bool isInit = false;

  late User user;
  late String userName;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      isInit = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJsonString = prefs.getString('user');
    if (userJsonString != null) {
      user = User.fromJson(jsonDecode(userJsonString!));
      userName = '${user.firstName} ${user.lastName}';
      print("111111111111111 ${userJsonString}");
      setState(() {
        isLogin = true;
      });
    }
    setState(() {
      isInit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isInit
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: isLogin
                    ? const Color.fromARGB(255, 193, 217, 229)
                    : Colors.transparent,
                leading: IconButton(
                  icon: const Icon(Icons
                      .qr_code_scanner_outlined), // Replace with the icon you want
                  onPressed: () {
                    // Handle the onTap event for the custom leading IconButton
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                ]),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: isLogin
                        ? const Color.fromARGB(255, 193, 217, 229)
                        : Colors.transparent,
                    child: isLogin
                        ? Avatar(userName: userName)
                        : const AvatarNone(),
                  ),
                  const Features(),
                  const SizedBox(height: 20),
                  if (!isLogin) const Landing(),
                ],
              ),
            ),
          );
  }
}

// class topBar extends StatelessWidget {
//   const topBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.qr_code_scanner),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings_outlined),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

class Avatar extends StatefulWidget {
  final String userName;
  const Avatar({required this.userName, Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(''),
            ),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    widget.userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    child: const Icon(Icons.edit_outlined, size: 20),
                    onTap: () {
                      Navigator.pushNamed(context, EditProfile.routeName);
                    },
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '@ruov',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                textAlign: TextAlign.left,
              ),
            ])
          ]),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

class AvatarNone extends StatelessWidget {
  const AvatarNone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(width: 16),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Guest',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          Text(
            '-',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
            textAlign: TextAlign.left,
          )
        ])
      ]),
    );
  }
}

class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.attach_money,
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
              icon: const Icon(Icons.wallet, size: 21.0, color: Colors.black),
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
              icon: const Icon(Icons.history, size: 21.0, color: Colors.black),
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
              icon: const Icon(Icons.favorite_outline,
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
              icon: const Icon(Icons.comment_outlined,
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
              icon: const Icon(Icons.download_outlined,
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
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: const Size(150, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.black),
              ),
            ),
            child: const Text(
              'Log in',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              fixedSize: const Size(150, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
