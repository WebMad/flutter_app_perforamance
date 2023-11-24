import 'dart:math';

import 'package:app_performance/src/listview_rendering/listview_builder.dart';
import 'package:app_performance/src/listview_rendering/listview_for.dart';
import 'package:flutter/material.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class ListViewRenderingScreen extends StatefulWidget {
  const ListViewRenderingScreen({super.key});

  @override
  State<ListViewRenderingScreen> createState() =>
      _ListViewRenderingScreenState();
}

class _ListViewRenderingScreenState extends State<ListViewRenderingScreen> {
  final items = [
    "Lorem ipsum dolor sit amet,",
    "consectetur adipiscing elit, ",
    "sed do eiusmod tempor incididunt ut labore ",
    "et dolore magna aliqua. Ut enim ad minim veniam, ",
    "quis nostrud exercitation ullamco laboris nisi ",
    "ut aliquip ex ea commodo consequat. ",
    "Duis aute irure dolor in reprehenderit in ",
    "voluptate velit esse cillum dolore eu fugiat ",
    "nulla pariatur. Excepteur sint occaecat ",
    "cupidatat non proident, sunt in culpa ",
    "qui officia deserunt mollit anim id ",
    "est laborum",
  ];

  bool isLowPerf = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView performance"),
      ),
      body: Column(
        children: [
          Expanded(
            child: isLowPerf
                ? ListViewFor(items: items)
                : ListViewBuilder(items: items),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isLowPerf = !isLowPerf;
              });
            },
            child: Text(
              "Switch to ${isLowPerf ? "high performance" : "low performance"} listview",
            ),
          ),
        ],
      ),
    );
  }
}
