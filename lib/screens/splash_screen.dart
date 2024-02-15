import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leaps_frontend/screens/landing/landing_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _getUserData();
    Future.delayed(const Duration(seconds: 3), () {
      if (isLogin) {
        // Navigator.pushNamed(context, MainScreen.routeName);
        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      } else {
        // Navigator.pushNamed(context, LandingScreen.routeName);
        Navigator.pushReplacementNamed(context, LandingScreen.routeName);
      }
    });
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    if (userid != null) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              // const Color.fromARGB(255, 173, 4, 77),
              // Colors.pink.shade800,
              // Color.fromARGB(255, 202, 83, 123),
              // const Color.fromARGB(255, 233, 87, 136),
              // const Color.fromARGB(255, 234, 92, 139),
              Colors.pink.shade800,
              Colors.pink.shade700,
              Colors.pink.shade600,
              Colors.pink.shade500,
              Colors.pink.shade400,
              Colors.pink.shade300,
              Colors.pink.shade200,
              Colors.pink.shade100,
              Colors.pink.shade50,
            ], // 渐变的颜色列表
            center: Alignment.center, // 渐变的中心点
            radius: 1,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to \nLeaps',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Live Engagement for All People and Sports",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
