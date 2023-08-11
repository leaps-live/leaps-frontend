import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomeGames extends StatefulWidget {
  const HomeGames({super.key});
  static const routeName = '/home_games';

  @override
  State<HomeGames> createState() => _HomeGamesState();
}

class _HomeGamesState extends State<HomeGames> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upcoming Games Near You",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: const Color.fromARGB(255, 242, 241, 241),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(
                    Remix.basketball_fill,
                    size: 30,
                  ),
                  Text(
                    "League Name",
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
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
        const SizedBox(
          height: 32,
        ),
        const Text(
          "Game Ranking",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
