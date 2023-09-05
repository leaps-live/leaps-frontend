import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/career/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/creator/createcenter_screen.dart';
import 'package:leaps_frontend/screens/game/create_game.dart';
import 'package:leaps_frontend/screens/game/creategame_screen.dart';
import 'package:leaps_frontend/screens/game/editgame_screen.dart';
import 'package:leaps_frontend/screens/game/game_screen.dart';
import 'package:leaps_frontend/screens/home/home_leagues.dart';
import 'package:leaps_frontend/screens/home/home_recommendations.dart';
import 'package:leaps_frontend/screens/home/homepage_screen.dart';
import 'package:leaps_frontend/screens/landing/confirmResetPassword_screen.dart';
import 'package:leaps_frontend/screens/landing/confirmationcode_screen.dart';
import 'package:leaps_frontend/screens/landing/forgot_password.dart';
import 'package:leaps_frontend/screens/landing/landing_screen.dart';
import 'package:leaps_frontend/screens/landing/login_screen.dart';
import 'package:leaps_frontend/screens/landing/register_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/createleague_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/editleague_screen.dart';
import 'package:leaps_frontend/screens/league/createLeague/firstCreateLeague.dart';
import 'package:leaps_frontend/screens/league/leaguePage/league_screen.dart';
import 'package:leaps_frontend/screens/livestream/confirmlivestream_screen.dart';
import 'package:leaps_frontend/screens/livestream/createlivestream_screen.dart';
import 'package:leaps_frontend/screens/main_screen.dart';
import 'package:leaps_frontend/screens/onboarding_screen.dart';
import 'package:leaps_frontend/screens/search/searchLeague.dart';
import 'package:leaps_frontend/screens/search/searchMember_screen.dart';
import 'package:leaps_frontend/screens/search/searchTeam.dart';
import 'package:leaps_frontend/screens/team/createTeam/createteam_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/editteam_screen.dart';
import 'package:leaps_frontend/screens/team/createTeam/firstCreateTeam.dart';
import 'package:leaps_frontend/screens/team/teamPage/team_screen.dart';
import 'package:leaps_frontend/screens/user/editprofile_screen.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/account_security.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/change_email.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/change_password.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/change_username.dart';
import 'package:leaps_frontend/screens/user/settings/account_security/manage_devices.dart';
import 'package:leaps_frontend/screens/user/settings/notifications/notifications.dart';
import 'package:leaps_frontend/screens/user/settings/privacy_settings/privacy_settings.dart';
import 'package:leaps_frontend/screens/user/settings/settings_screen.dart';
import 'package:leaps_frontend/screens/user/userprofile_screen.dart';

var allRoutes = <String, WidgetBuilder>{
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  UserProfileScreen.routeName: (context) => const UserProfileScreen(),
  CareerProfileScreen.routeName: (context) => const CareerProfileScreen(),
  CreateLeagueScreen.routeName: (context) => const CreateLeagueScreen(),
  CreateTeamScreen.routeName: (context) => const CreateTeamScreen(),
  EditTeamScreen.routeName: (context) => EditTeamScreen(
      searchResult:
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
  EditLeagueScreen.routeName: (context) => EditLeagueScreen(
      searchResult:
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
  SearchMemberScreen.routeName: (context) => const SearchMemberScreen(),
  CreateCenterScreen.routeName: (context) => const CreateCenterScreen(),
  CreateGameScreen.routeName: (context) => const CreateGameScreen(),
  CreateLiveStreamScreen.routeName: (context) => const CreateLiveStreamScreen(),
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
  AccountSecurity.routeName: (context) => const AccountSecurity(),
  Notifications.routeName: (context) => const Notifications(),
  PrivacySettings.routeName: (context) => const PrivacySettings(),
  ChangeUsername.routeName: (context) => const ChangeUsername(),
  ChangeEmail.routeName: (context) => const ChangeEmail(),
  ChangePassword.routeName: (context) => const ChangePassword(),
  ManageDevices.routeName: (context) => const ManageDevices(),
  FirstCreateTeam.routeName: (context) => const FirstCreateTeam(),
  SearchTeam.routeName: (context) => const SearchTeam(),
  SearchLeague.routeName: (context) => const SearchLeague(),
  FirstCreateLeague.routeName: (context) => const FirstCreateLeague(),
  HomeRecommendations.routeName: (context) => const HomeRecommendations(),
  HomeLeagues.routeName: (context) => const HomeLeagues(),
  GameSelectScreen.routeName: (context) => const GameSelectScreen(),
  ConfirmationCodeScreen.routeName: (context) =>
      const ConfirmationCodeScreen(arguments: {}),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  ConfirmResetPasswordScreen.routeName: (context) =>
      const ConfirmLiveStreamScreen()
};
