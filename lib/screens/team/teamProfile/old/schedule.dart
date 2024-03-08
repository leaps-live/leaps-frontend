import 'package:flutter/material.dart';

class schedule extends StatefulWidget {
  const schedule({super.key});

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Past"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
        SizedBox(
          height: 200, // Adjust the height as needed
          child: TabBarView(
            controller: _tabController,
            children: const [
              upcoming(),
              Text("fafaf"),
            ],
          ),
        ),
      ],
    );
  }
}

class upcoming extends StatefulWidget {
  const upcoming({super.key});

  @override
  State<upcoming> createState() => _upcomingState();
}

class _upcomingState extends State<upcoming> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [Icon(Icons.schedule), Text("  7/26/2023 8:00 PM")],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [Icon(Icons.location_on_outlined), Text("  UW IMA")],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.face_4,
                      size: 50,
                    ),
                    Text(
                      "  Team A",
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.face_5,
                      size: 50,
                    ),
                    Text(
                      "  Team B",
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      'Notify',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
