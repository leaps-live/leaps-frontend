import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class TeamMembersSelectionScreen extends StatefulWidget {
  const TeamMembersSelectionScreen({super.key});

  static const routeName = '/team_members_selection';

  @override
  State<TeamMembersSelectionScreen> createState() =>
      _TeamMembersSelectionScreenState();
}

class _TeamMembersSelectionScreenState
    extends State<TeamMembersSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Solar Surfers',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
