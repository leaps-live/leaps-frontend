import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/createteam_screen.dart';
import 'package:leaps_frontend/screens/createLeague_screen.dart';
import 'package:leaps_frontend/screens/editleague_screen.dart';
import 'package:leaps_frontend/screens/editteam_screen.dart';

class CreateCenterScreen extends StatefulWidget {
  const CreateCenterScreen({super.key});
  static const routeName = '/create_center';

  @override
  State<CreateCenterScreen> createState() => _CreateCenterScreenState();
}

class _CreateCenterScreenState extends State<CreateCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "GO HOME",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Creator Center",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateTeamScreen.routeName);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.groups), // 添加图标
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Create a team",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateLeagueScreen.routeName);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.corporate_fare), // 添加图标
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Create a league",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.sports_basketball), // 添加图标
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Create a game",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.live_tv), // 添加图标
                          SizedBox(width: 8), // 图标和文本之间的间距
                          Text(
                            "Live streaming",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              const Text(
                "Manage Teams",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditTeamScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditTeamScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditTeamScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const Text(
                "Manage Leagues",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditLeagueScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditLeagueScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditLeagueScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Placeholder",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
