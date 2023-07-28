import 'package:flutter/material.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    color: Colors.grey,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title of the video",
                        style: TextStyle(fontSize: 17),
                      ),
                      Icon(Icons.unfold_more)
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    color: Colors.grey,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title of the video",
                        style: TextStyle(fontSize: 17),
                      ),
                      Icon(Icons.unfold_more)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  color: Colors.grey,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Title of the video",
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(Icons.unfold_more)
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  color: Colors.grey,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Title of the video",
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(Icons.unfold_more)
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
