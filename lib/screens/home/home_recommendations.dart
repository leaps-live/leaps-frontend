import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import '../../utils/colors.dart';

class HomeRecommendations extends StatefulWidget {
  const HomeRecommendations({super.key});
  static const routeName = '/home';

  @override
  State<HomeRecommendations> createState() => _HomeRecommendationsState();
}

class _HomeRecommendationsState extends State<HomeRecommendations> {
  // final List<String> imageUrls = [
  //   "assets/images/swiper1.jpg",
  //   "assets/images/swiper2.jpeg",
  //   "assets/images/swiper3.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Team Recruitment(12)"),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Remix.equalizer_line,
                color: Color(0xFF2E3A59),
              ),
            ),
            Text("Filter")
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(176, 175, 175, 1), // 边框颜色
                  width: 2.0, // 边框宽度
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "gauhgah",
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(75, 75, 75, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
