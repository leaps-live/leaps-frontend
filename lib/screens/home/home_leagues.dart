import 'package:flutter/material.dart';

class HomeLeagues extends StatefulWidget {
  const HomeLeagues({super.key});
  static const routeName = '/home_leagues';

  @override
  State<HomeLeagues> createState() => _HomeLeaguesState();
}

class _HomeLeaguesState extends State<HomeLeagues> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Leagues",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "CBA",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "NBA",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Leagues Near You",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "CBA",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "NBA",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "New Leagues",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "CBA",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.abc,
              size: 50,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "NBA",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
