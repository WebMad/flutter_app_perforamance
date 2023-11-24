import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  final List<String> items;

  const ListViewBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text("${index + 1}."),
          title: Text(items[index % items.length]),
        );
      },
      itemCount: 1000,
    );
  }
}
