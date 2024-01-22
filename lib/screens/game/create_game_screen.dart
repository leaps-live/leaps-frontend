import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/game/create_game_2_screen.dart';
import 'package:leaps_frontend/utils/colors.dart';

class CreateGameScreen extends StatefulWidget {
  const CreateGameScreen({super.key});
  static const routeName = '/create_game';

  @override
  State<CreateGameScreen> createState() => _CreateGameScreenState();
}

enum SingingCharacter { lafayette, jefferson, washington }

class _CreateGameScreenState extends State<CreateGameScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  bool _isLeagueSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            child: const Text("Cancel",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text("Create a game"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select your team",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      activeColor: primaryColor,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(17), // Image radius
                        child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Mighty Dragons',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                horizontalTitleGap: 0,
              ),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      activeColor: primaryColor,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(17), // Image radius
                        child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Mighty Dragons',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                horizontalTitleGap: 0,
              ),
              const SizedBox(height: 10),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<SingingCharacter>(
                      value: SingingCharacter.washington,
                      groupValue: _character,
                      activeColor: primaryColor,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(17), // Image radius
                        child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Mighty Dragons',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                horizontalTitleGap: 0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, CreateGameTwoScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: const Size(300, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text('Next',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              const SizedBox(
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Row(
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         setState(() {
              //           _isLeagueSelected = true;
              //         });
              //       },
              //       style: ButtonStyle(
              //         padding: MaterialStateProperty.all(
              //           const EdgeInsets.symmetric(horizontal: 0),
              //         ),
              //         overlayColor: MaterialStateProperty.all<Color>(
              //           _isLeagueSelected
              //               ? Colors.transparent
              //               : Colors.grey.withOpacity(0.2),
              //         ),
              //       ),
              //       child: Text(
              //         "Select a league",
              //         style: TextStyle(
              //           fontSize: 17,
              //           color: _isLeagueSelected ? Colors.red : Colors.black,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 16),
              //     TextButton(
              //       onPressed: () {
              //         setState(() {
              //           _isLeagueSelected = false;
              //         });
              //       },
              //       style: ButtonStyle(
              //         padding: MaterialStateProperty.all(
              //           const EdgeInsets.symmetric(horizontal: 0),
              //         ),
              //         overlayColor: MaterialStateProperty.all<Color>(
              //           !_isLeagueSelected
              //               ? Colors.transparent
              //               : Colors.grey.withOpacity(0.2),
              //         ),
              //       ),
              //       child: Text(
              //         "Pickup game",
              //         style: TextStyle(
              //           fontSize: 17,
              //           color: !_isLeagueSelected ? Colors.red : Colors.black,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 16),
              // if (_isLeagueSelected)
              //   Column(
              //     children: [
              //       Text("You are the admin for the leagues below:"),
              //       GestureDetector(
              //         child:
              //             Text("Placeholder", style: TextStyle(fontSize: 23)),
              //         onTap: () {
              //           Navigator.pushNamed(
              //               context, CreateGameScreen.routeName);
              //         },
              //       )
              //     ],
              //   )