import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const routeName = '/home_page';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<void> testNode() async {
    var url = Uri.parse('http://localhost:8080/routers/teams/test');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      // success
      var responseData = response.body;
      // process responseData
      print(responseData);
    } else {
      // fail
      print('fail request ${response.statusCode}');
    }
  }

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
      body: Column(
        children: [
          SizedBox(
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
              pagination: const SwiperPagination(),
              // control: SwiperControl(),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          TextButton(
            onPressed: () {
              testNode();
            },
            child: Text("test nodeJS"),
          ),
        ],
      ),
    );
  }
}
