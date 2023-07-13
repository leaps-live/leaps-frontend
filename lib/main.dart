import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/onboarding_screen.dart';
import 'package:leaps_frontend/screens/userprofile_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEAPS = Live-streaming Engagement for All People and Sports',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme.of(context).copyWith(
              backgroundColor: backgroundColor,
              elevation: 0,
              titleTextStyle: const TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              iconTheme: const IconThemeData(color: primaryColor))),
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        UserProfileScreen.routeName: (context) => const UserProfileScreen(),
        CareerProfileScreen.routeName: (context) => const CareerProfileScreen()
      }, // theme give
      home: const MainScreen(),
    );
  }
}
