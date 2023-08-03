import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/search/searchTeam.dart';

class FirstCreateTeam extends StatefulWidget {
  const FirstCreateTeam({super.key});
  static const routeName = '/first_create_team';

  @override
  State<FirstCreateTeam> createState() => _FirstCreateTeamState();
}

class _FirstCreateTeamState extends State<FirstCreateTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Team Name"),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Done',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Team Members',
              style: TextStyle(fontSize: 17),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchTeam.routeName);
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 35,
                )),
            const SizedBox(height: 16.0),
            const Text(
              'Joined',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Icon(
                  Icons.face,
                  size: 40,
                ),
                SizedBox(width: 10.0),
                Text('Placeholder', style: TextStyle(fontSize: 17)),
                Spacer(),
                Text(
                  "Creator",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
