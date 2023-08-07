import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/career/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/landing/landing_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/createleague_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/firstCreateLeague.dart';
import 'package:leaps_frontend/screens/search/searchLeague.dart';
import 'package:leaps_frontend/screens/search/searchTeam.dart';
import 'package:leaps_frontend/screens/splash_screen.dart';
import 'package:leaps_frontend/routes.dart';
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
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              iconTheme: const IconThemeData(color: Colors.black))),
      routes: allRoutes,
      home: const SplashScreen(),
    );
  }
}
