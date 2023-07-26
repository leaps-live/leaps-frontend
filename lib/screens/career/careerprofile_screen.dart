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
          children: const [
            HeroContent(),
            SizedBox(height: 30),
            ExperienceContent()
          ],
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
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.person_add,
                                size: 35.0, color: primaryColor),
                            Icon(Icons.sms, size: 35.0, color: primaryColor),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '5,096 Fans',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15.0),
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEFEFE),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.25, color: Color(0xFFE6E6E6)),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PTS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '124',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    )
                                  ]),
                              VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 20,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'REB',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '124',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    )
                                  ]),
                              VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 20,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ASST',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '124',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    )
                                  ]),
                              VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 20,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'GP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '124',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.left,
                                    )
                                  ]),
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      width: MediaQuery.of(context).size.width * 0.44,
                      decoration: ShapeDecoration(
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.25, color: Color(0xFFE6E6E6)),
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About me:',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Text(
                            '19 y/o',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '19 y/o',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '19 y/o',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Container(
                      height: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      width: MediaQuery.of(context).size.width * 0.44,
                      decoration: ShapeDecoration(
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.10, color: Color(0xFFE6E6E6)),
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Social Media:',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 10),
                          Icon(Icons.facebook,
                              size: 25.0, color: secondaryBackgroundColor),
                          Icon(Icons.facebook,
                              size: 25.0, color: secondaryBackgroundColor),
                          Icon(Icons.facebook,
                              size: 25.0, color: secondaryBackgroundColor),
                        ],
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ExperienceContent extends StatelessWidget {
  const ExperienceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '<-- Insert Toggle Button Here -->',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const Text(
          'Now',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: ShapeDecoration(
                color: const Color(0xFFFEFEFE),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PTS',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '124',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.left,
                              )
                            ]),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'REB',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '124',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.left,
                              )
                            ]),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ASST',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '124',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.left,
                              )
                            ]),
                        VerticalDivider(
                          width: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GP',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '124',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.left,
                              )
                            ]),
                      ]))
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
