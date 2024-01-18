import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens/game/creategame_screen.dart';

class GameSelectScreen extends StatefulWidget {
  const GameSelectScreen({super.key});
  static const routeName = '/game_select';

  @override
  State<GameSelectScreen> createState() => _GameSelectScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _GameSelectScreenState extends State<GameSelectScreen> {
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
              ListTile(
                title: const Text('Lafayette'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
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