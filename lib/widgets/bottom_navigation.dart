import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.home,
      size: 150,
    ),
    Icon(
      Icons.favorite,
      size: 150,
    ),
    Icon(
      Icons.add,
      size: 150,
    ),
    Icon(
      Icons.star_rounded,
      size: 150,
    ),
    Icon(
      Icons.person,
      size: 150,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'For you',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Career',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: primaryColor),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
