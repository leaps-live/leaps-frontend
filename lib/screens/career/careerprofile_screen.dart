import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:share_plus/share_plus.dart';

class CareerProfileScreen extends StatelessWidget {
  static const routeName = '/careerprofile';
  const CareerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        SizedBox(height: 30),
        HeroContent(),
        SizedBox(height: 30),
        ExperienceContentState()
      ],
    ));
  }
}

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          // padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Ruolin Chen',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 5),
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
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.person_add_outlined,
                                size: 35.0, color: primaryColor),
                            const SizedBox(width: 15),
                            const Icon(Icons.sms_outlined,
                                size: 35.0, color: primaryColor),
                            const SizedBox(width: 15),
                            IconButton(
                              icon: const Icon(Icons.share_outlined,
                                  size: 35.0, color: primaryColor),
                              onPressed: () {
                                Share.share("Share something!!!");
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '5,096 Fans',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 25),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 5),
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
                      height: 150,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'About me:',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '19 y/o',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * .035,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '6\'1',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * .035,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Seattle, WA',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * .035,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Container(
                      height: 150,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Social Media:',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: secondaryBackgroundColor),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.facebook,
                                  size: 25.0, color: secondaryBackgroundColor),
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Text(
                                '@ruolinchenasdfasdf',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth * .035,
                                    color: secondaryBackgroundColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.facebook,
                                  size: 25.0, color: secondaryBackgroundColor),
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Text(
                                '@ruolinchenasdfasdf',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth * .035,
                                    color: secondaryBackgroundColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.facebook,
                                  size: 25.0, color: secondaryBackgroundColor),
                              const SizedBox(width: 5),
                              Expanded(
                                  child: Text(
                                '@ruolinchenasdfasdf',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth * .035,
                                    color: secondaryBackgroundColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                            ],
                          ),
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

class ExperienceContentState extends StatefulWidget {
  const ExperienceContentState({super.key});

  @override
  State<ExperienceContentState> createState() => ExperienceContent();
}

const List<Widget> choices = <Widget>[
  Text('Experience'),
  Text('Highlights'),
  Text('Fans')
];

class ExperienceContent extends State<ExperienceContentState> {
  final List<bool> _selectedChoices = <bool>[true, false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ToggleButtons(
          direction: vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _selectedChoices.length; i++) {
                _selectedChoices[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: primaryColor,
          selectedColor: Colors.white,
          fillColor: primaryColor,
          color: primaryColor,
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 100.0,
          ),
          isSelected: _selectedChoices,
          children: choices,
        ),
        const SizedBox(height: 20),
        const Text(
          'Now',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const ExperienceWidget(),
        const SizedBox(height: 15),
        const ExperienceWidget(),
        const SizedBox(height: 15),
        const ExperienceWidget(),
        const SizedBox(height: 15),
        const ExperienceWidget(),
      ],
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 75,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
                width: 2.5,
              ),
              color: const Color(0xFFFEFEFE),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(23), // Image radius
                      child: Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Point Guard',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Mighty Dragons',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PTS',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '20.0',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PTS',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '20.0',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PTS',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '20.0',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ])),
      ],
    );
  }
}
