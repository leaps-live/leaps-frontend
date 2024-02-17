import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';

import '../../utils/colors.dart';
import 'login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const routeName = '/landing';

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: SafeArea(
  //     child: Center(
  //       child: Column(
  //         children: [
  //           const SizedBox(
  //             height: 250,
  //           ),
  //           const Icon(
  //             Icons.face,
  //             size: 100,
  //           ),
  //           const SizedBox(
  //             height: 180,
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.pushNamed(context, RegisterScreen.routeName);
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: primaryColor,
  //               fixedSize: const Size(300, 40),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //             ),
  //             child: const Text('Sign up'),
  //           ),
  //           const SizedBox(
  //             height: 8,
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.pushNamed(context, LoginScreen.routeName);
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               fixedSize: const Size(300, 40),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //             ),
  //             child: const Text(
  //               'Log in',
  //               style: TextStyle(color: Colors.black),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 16,
  //           ),
  //           GestureDetector(
  //             child: const Text(
  //               "Continue as a guest",
  //               style: TextStyle(fontSize: 16),
  //             ),
  //             onTap: () {
  //               Navigator.pushReplacementNamed(context, MainScreen.routeName);
  //             },
  //           )
  //         ],
  //       ),
  //     ),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            },
            child: const Text(
              'Guest   ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        ],
        backgroundColor: primaryBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100), // Add
              const Text('Leaps', style: TextStyle(color: primaryColor)),
              //const SizedBox(height: 390), // Add
              //             ),
              //           ),
              //         ),
              const SizedBox(
                height: 16,
              ),

              // AREA TO FIX "CREATE A BUTTON" PLACEMENT

              //Center(
              //child: ElevatedButton(
              // onPressed: () {
              //   Navigator.pushNamed(context, LoginScreen.routeName);
              // },
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: Colors.white,
              //   fixedSize: const Size(300, 40),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              // ),

              //const SizedBox(height: 90),

              //child:
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            fixedSize: const Size(300, 42),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Create an account',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 56),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: grayShadeColor,
                            fixedSize: const Size(160, 37),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text('Log in with email',
                              style: TextStyle(color: secondaryTextColor)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/images/google.png', // 替换为你的图片路径
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(Icons.apple, size: 35),
                      ],
                    ),
                  ],
                ),
              )),
              const SizedBox(
                height: 56,
              ),
              //),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
