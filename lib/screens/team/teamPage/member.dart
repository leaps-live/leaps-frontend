import 'package:flutter/material.dart';

class member extends StatefulWidget {
  const member({super.key});

  @override
  State<member> createState() => _memberState();
}

class _memberState extends State<member> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.abc,
                size: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                  child: const Text(
                    "Placeholder",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.abc,
                size: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                  child: const Text(
                    "Placeholder",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.abc,
                size: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                  child: const Text(
                    "Placeholder",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.abc,
                size: 50,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10), // 设置左边距为10
                  child: const Text(
                    "Placeholder",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
