import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/onboarding_screen.dart';
import 'package:leaps_frontend/screens/userprofile_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const OnboardingScreen(),
    const UserProfileScreen(),
    const CareerProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 14,
      selectedItemColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.favorite,
              color: primaryColor,
            ),
            icon: Icon(Icons.favorite),
            label: 'For you',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.add,
              color: primaryColor,
            ),
            icon: Icon(Icons.add),
            label: 'Create',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.star_rounded,
              color: primaryColor,
            ),
            icon: Icon(
              Icons.star_rounded,
            ),
            label: 'Career',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: primaryColor,
            ),
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: primaryColor),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
