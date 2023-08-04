import 'package:flutter/material.dart';
import 'package:leaps_frontend/utils/colors.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import '../account_security/change_username.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});
  static const routeName = '/notifications';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final mentionController = ValueNotifier<bool>(false);
  final likesController = ValueNotifier<bool>(false);
  final commentController = ValueNotifier<bool>(false);
  final followerController = ValueNotifier<bool>(false);

  // @override
  // void initState() {
  //   super.initState();

  //   _controller.addListener(() {
  //     setState(() {
  //       if (_controller00.value) {
  //         _controller = true;
  //       } else {
  //         _controller = false;
  //       }
  //     });
  //   });
  // }

// ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Mention @",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  const Spacer(),
                  AdvancedSwitch(
                    controller: mentionController,
                    activeColor: primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  const Text(
                    "Likes",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  const Spacer(),
                  AdvancedSwitch(
                    controller: likesController,
                    activeColor: primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  const Text(
                    "Comments",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  const Spacer(),
                  AdvancedSwitch(
                    controller: commentController,
                    activeColor: primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  const Text(
                    "New followers",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  const Spacer(),
                  AdvancedSwitch(
                    controller: followerController,
                    activeColor: primaryColor,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
