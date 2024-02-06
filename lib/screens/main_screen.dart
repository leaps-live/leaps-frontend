import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/career/careerprofile_screen.dart';
import 'package:leaps_frontend/screens/creator/creatorcenter_screen.dart';
import 'package:leaps_frontend/screens/home/homepage_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePageScreen(),
    const CreateCenterScreen(),
    const CareerProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondaryBackgroundColor,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 25,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(
                Remix.home_line,
                color: primaryColor,
              ),
              icon: Icon(Remix.home_line),
              label: "Home",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Remix.add_line,
                color: primaryColor,
              ),
              icon: Icon(Icons.add),
              label: 'Create',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Remix.user_5_fill,
                color: primaryColor,
              ),
              icon: Icon(Remix.user_5_fill),
              label: 'Profile',
              backgroundColor: primaryColor),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
