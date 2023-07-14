import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: 250,
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/1629630.png",
              fit: BoxFit.fill,
            );
          },
          itemCount: 3,
          pagination: SwiperPagination(),
          // control: SwiperControl(),
        ),
      ),
    );
  }
}
