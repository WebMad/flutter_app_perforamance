import 'package:flutter/material.dart';

class ListViewFor extends StatelessWidget {
  final List<String> items;

  const ListViewFor({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 1000; i++)
            ListTile(
              leading: Text("${i + 1}."),
              title: Text(items[i % items.length]),
            ),
        ],
      ),
    );
  }
}
