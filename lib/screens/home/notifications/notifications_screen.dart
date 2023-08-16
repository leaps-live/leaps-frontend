import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  static const routeName = '/notifications-screen';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Remix.mail_line),
            color: const Color(0xFF2E3A59),
          )
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true, // Make the TabBar scrollable
            tabs: const [
              Tab(text: "Likes"),
              Tab(text: "Comments"),
              Tab(text: "Mentions"),
              Tab(text: "Requests"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 15,
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
              children: [
                const Likes(),
                Text("Comments content"),
                Text("Mentions content"),
                Text("Requests content"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Ruolin Chen"),
                        const SizedBox(width: 5),
                        Text(
                          "today",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text("has liked your highlight video"),
                  ],
                ),
                const Spacer(),
                Container(width: 90, height: 50, color: Colors.grey),
              ],
            )
          ],
        ));
  }
}
