import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:leaps_frontend/screens/createLeague_screen.dart';
import 'package:leaps_frontend/screens/onboarding_screen.dart';
import 'package:leaps_frontend/screens/searchMember_screen.dart';
import 'package:leaps_frontend/screens/userprofile_screen.dart';
=======
>>>>>>> 6585ee25f6ac991827f71d3978261572960076d0
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
<<<<<<< HEAD
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        UserProfileScreen.routeName: (context) => const UserProfileScreen(),
        CreateLeagueScreen.routeName: (context) => const CreateLeagueScreen(),
        SearchMemberScreen.routeName: (context) => const SearchMemberScreen(),
      }, // theme give
      home: const OnboardingScreen(),
=======
      // routes: {
      //   OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      //   UserProfileScreen.routeName: (context) => const UserProfileScreen(),
      //   CareerProfileScreen.routeName: (context) => const CareerProfileScreen()
      // }, // theme give
      home: const MainScreen(),
>>>>>>> 6585ee25f6ac991827f71d3978261572960076d0
    );
  }
}
