import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/career/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/landing/landing_screen.dart';
import 'package:leaps_frontend/screens/league/createleague_screen.dart';
import 'package:leaps_frontend/screens/splash_screen.dart';
import 'package:leaps_frontend/screens/team/createteam_screen.dart';
import 'package:leaps_frontend/screens/game/creategame_screen.dart';
import 'package:leaps_frontend/screens/livestream/createlivestream_screen.dart';
import 'package:leaps_frontend/screens/livestream/confirmlivestream_screen.dart';
import 'package:leaps_frontend/screens/league/editleague_screen.dart';
import 'package:leaps_frontend/screens/team/editteam_screen.dart';
import 'package:leaps_frontend/screens/game/editgame_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/onboarding_screen.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/screens/user/editprofile_screen.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';
import 'package:leaps_frontend/screens/user/settings_screen.dart';
import 'package:leaps_frontend/screens/user/userprofile_screen.dart';
import 'package:leaps_frontend/screens/creator/createcenter_screen.dart';
import 'package:leaps_frontend/screens/home/homepage_screen.dart';
import 'package:leaps_frontend/screens/league/leaguePage/league_screen.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_screen.dart';
import 'package:leaps_frontend/screens/game/game_screen.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/landing/login_screen.dart';
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
        MainScreen.routeName: (context) => const MainScreen(),
        LeagueScreen.routeName: (context) => const LeagueScreen(),
        TeamScreen.routeName: (context) => const TeamScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        LandingScreen.routeName: (context) => const LandingScreen(),
        EditProfile.routeName: (context) => const EditProfile(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
