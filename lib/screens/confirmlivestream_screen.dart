import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leaps_frontend/screens/userprofile_screen.dart';

class ConfirmLiveStreamScreen extends StatefulWidget {
  const ConfirmLiveStreamScreen({Key? key}) : super(key: key);
  static const routeName = '/confirm_livestream';

  @override
  State<ConfirmLiveStreamScreen> createState() =>
      _ConfirmLiveStreamScreenState();
}

class _ConfirmLiveStreamScreenState extends State<ConfirmLiveStreamScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text(
            'Title of the Live Stream',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, UserProfileScreen.routeName);
              },
              child: const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/237/200/300'),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Room Number: 1234567',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: (const Icon(
                    Icons.ios_share,
                    size: 15,
                  )),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "gaga",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.live_tv,
                    size: 200,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.flip),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // do something after clicking create button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Start Streaming'),
              ),
            ),
          ],
        ));
  }
}
