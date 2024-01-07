import 'package:flutter/material.dart';

class CareerVideos extends StatefulWidget {
  const CareerVideos({super.key});
  static const routeName = '/careerprofile';

  @override
  State<CareerVideos> createState() => _CareerVideosState();
}

class _CareerVideosState extends State<CareerVideos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
