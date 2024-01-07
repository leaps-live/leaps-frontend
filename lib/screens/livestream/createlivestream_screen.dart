import 'package:flutter/material.dart';
import 'package:leaps_frontend/screens//search/searchMember_screen.dart';
import 'package:leaps_frontend/screens/livestream/confirmlivestream_screen.dart';

class CreateLiveStreamScreen extends StatefulWidget {
  const CreateLiveStreamScreen({super.key});
  static const routeName = '/create_livestream';

  @override
  State<CreateLiveStreamScreen> createState() => _CreateLiveStreamScreenState();
}

class _CreateLiveStreamScreenState extends State<CreateLiveStreamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Live Stream",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(''),
            ),
            SizedBox(
              width: 16,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Ruolin Chen',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.qr_code_scanner,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '@ruov',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                textAlign: TextAlign.left,
              )
            ]),
          ]),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Choose Game",
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SearchMemberScreen.routeName);
            },
            child: const Icon(Icons.search, color: Colors.black, size: 25),
          ),
          const SizedBox(
            height: 24,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Title",
              hintText: "Title",
              labelStyle: TextStyle(color: Colors.black, fontSize: 17),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Description",
              hintText: "Some description about this live stream",
              labelStyle: TextStyle(color: Colors.black, fontSize: 17),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // do something after clicking create button
                Navigator.pushNamed(context, ConfirmLiveStreamScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                fixedSize: const Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Next'),
            ),
          ),
        ]),
      ),
    );
  }
}
