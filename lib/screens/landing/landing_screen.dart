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
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 0.15 * heightRatio), // Add
              const Text('Leaps', style: TextStyle(color: primaryColor)),
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
                            //fixedSize: const Size(300, 42),
                            fixedSize: Size(widthRatio * 0.7, heightRatio * 0.05),
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
                            ],
                          )),
                    ),
                    // SizedBox(height: 56),
                    SizedBox(height: heightRatio * 0.05),
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
                            // fixedSize: const Size(160, 37),
                            fixedSize: Size(widthRatio * 0.45, heightRatio * 0.05),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text('Log in with email',
                              style: TextStyle(color: secondaryTextColor)),
                        ),
                        SizedBox(
                          //width: 20,
                          width: widthRatio * 0.03,
                        ),
                        Image.asset(
                          'assets/images/google.png', // 替换为你的图片路径
                          // width: 35,
                          // height: 35,
                          width: heightRatio * 0.040,
                          height: heightRatio * 0.040,
                        ),
                        SizedBox(
                          // width: 20,
                          width: widthRatio * 0.025,
                        ),
                        Icon(Icons.apple, size: heightRatio * 0.040),
                      ],
                    ),
                  ],
                ),
              )),
              SizedBox(
                // height: 56,
                height: heightRatio * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
