import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/createleague_screen.dart';
import 'package:leaps_frontend/screens/createteam_screen.dart';
import 'package:leaps_frontend/screens/creategame_screen.dart';
import 'package:leaps_frontend/screens/createlivestream_screen.dart';
import 'package:leaps_frontend/screens/confirmlivestream_screen.dart';
import 'package:leaps_frontend/screens/editleague_screen.dart';
import 'package:leaps_frontend/screens/editteam_screen.dart';
import 'package:leaps_frontend/screens/editgame_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/onboarding_screen.dart';
import 'package:leaps_frontend/screens/searchMember_screen.dart';
import 'package:leaps_frontend/screens/userprofile_screen.dart';
import 'package:leaps_frontend/screens/createcenter_screen.dart';
import 'package:leaps_frontend/screens/homepage_screen.dart';
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
        CareerProfileScreen.routeName: (context) => const CareerProfileScreen(),
        CreateLeagueScreen.routeName: (context) => const CreateLeagueScreen(),
        CreateTeamScreen.routeName: (context) => const CreateTeamScreen(),
        EditTeamScreen.routeName: (context) => const EditTeamScreen(),
        EditLeagueScreen.routeName: (context) => const EditLeagueScreen(),
        SearchMemberScreen.routeName: (context) => const SearchMemberScreen(),
        CreateCenterScreen.routeName: (context) => const CreateCenterScreen(),
        CreateGameScreen.routeName: (context) => const CreateGameScreen(),
        CreateLiveStreamScreen.routeName: (context) =>
            const CreateLiveStreamScreen(),
        EditGameScreen.routeName: (context) => const EditGameScreen(),
        HomePageScreen.routeName: (context) => const HomePageScreen(),
        ConfirmLiveStreamScreen.routeName: (context) =>
            const ConfirmLiveStreamScreen(),
        MainScreen.routeName: (context) => const MainScreen()
      },
      home: const MainScreen(),
    );
  }
}
