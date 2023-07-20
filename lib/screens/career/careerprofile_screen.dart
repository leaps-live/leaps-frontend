import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';

class CareerProfileScreen extends StatelessWidget {
  static const routeName = '/careerprofile';
  const CareerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        body: ListView(
          children: const [HeroContent()],
        ));
  }
}

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Ruolin Chen',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'PG',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.person_add,
                                size: 35.0, color: primaryColor),
                            Icon(Icons.sms, size: 35.0, color: primaryColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '5,096 Fans',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 25),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '1201 Views',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.grey),
                              textAlign: TextAlign.left,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(68), // Image radius
                        child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                )
              ]),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 18.0),
                width: MediaQuery.of(context).size.width * 0.90,
                // height: 230,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFEFEFE),
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.25, color: Color(0xFFE6E6E6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://picsum.photos/id/237/200/300'),
                          ),
                          Column(children: [
                            Text(
                              'Ruolin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Ruov',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15),
                              textAlign: TextAlign.left,
                            )
                          ])
                        ]),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_square,
                            size: 21.0, color: Colors.black),
                        label: const Text('Edit Profile',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                color: Colors.black),
                            textAlign: TextAlign.center)),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.settings,
                            size: 21.0, color: Colors.black),
                        label: const Text('Settings',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                                color: Colors.black),
                            textAlign: TextAlign.center))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
