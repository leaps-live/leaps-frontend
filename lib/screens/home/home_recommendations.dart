import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class HomeRecommendations extends StatefulWidget {
  const HomeRecommendations({super.key});
  static const routeName = '/home';

  @override
  State<HomeRecommendations> createState() => _HomeRecommendationsState();
}

class _HomeRecommendationsState extends State<HomeRecommendations> {
  final List<String> imageUrls = [
    "assets/images/swiper1.jpg",
    "assets/images/swiper2.jpeg",
    "assets/images/swiper3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                imageUrls[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: 3,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Color(0xFF7D7D7D),
                activeColor: primaryColor,
              ),
            ),
            // control: SwiperControl(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Live Games",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
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
        const SizedBox(
          height: 16,
        ),
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
                  "NCAA",
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
