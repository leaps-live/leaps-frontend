import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/user/profile_screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                image:
                    DecorationImage(fit: BoxFit.fill, image: NetworkImage(''))),
            child: Text(
              'Ruolin Chen',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () =>
                {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () =>
                {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () =>
                {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () =>
                {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () =>
                {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
        ],
      ),
    );
  }
}
