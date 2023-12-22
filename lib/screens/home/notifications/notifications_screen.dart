import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';
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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
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
              Tab(text: "Games"),
              Tab(text: "Likes"),
              Tab(text: "Comments"),
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
            height: 500, // Adjust the height as needed
            child: TabBarView(
              controller: _tabController,
              children: const [
                Games(),
                Likes(),
                Comments(),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const Flexible(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "8 users have liked your highlight video from UW CSSA Winter Leagues",
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Today",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(width: 50, height: 50, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Flexible(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "23 users have liked your highlight video from SeattleU Spring League.",
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Aug 20",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(width: 50, height: 50, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ruolin Chen",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text("Nice Game!!!"),
                    SizedBox(height: 5),
                    Text(
                      "Today",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Francis Tang",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text("Nice Game!!!"),
                    SizedBox(height: 5),
                    Text(
                      "Today",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                ),
              ],
            )
          ],
        ));
  }
}

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.face,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "UW CSSA Winter League",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Best Team LEAPS vs Random game is starting soon at 10:00 a.m.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 5),
              Text(
                "3m ago",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.face,
                    size: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "SeattleU Spring League",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Best Team LEAPS vs Random game is starting soon at 10:00 a.m.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 5),
              Text(
                "3m ago",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
