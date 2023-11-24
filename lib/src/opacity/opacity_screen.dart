import 'dart:ui';

import 'package:app_performance/src/opacity/opacity_animated.dart';
import 'package:app_performance/src/opacity/opacity_filter.dart';
import 'package:app_performance/src/opacity/opacity_widget.dart';
import 'package:flutter/material.dart';

class OpacityScreen extends StatefulWidget {
  const OpacityScreen({super.key});

  @override
  State<OpacityScreen> createState() => _OpacityScreenState();
}

class _OpacityScreenState extends State<OpacityScreen> {
  int _selectedIndex = 0;

  final widgets = <Widget>[
    const OpacityWidget(),
    const OpacityFilter(),
    const OpacityAnimated()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opacity"),
      ),
      body: widgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            label: 'Filter opacity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: 'AnimatedOpacity',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
