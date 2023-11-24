import 'package:flutter/material.dart';

class OpacityFilter extends StatefulWidget {
  final double opacity;

  const OpacityFilter({super.key, this.opacity = 0.5});

  @override
  State<OpacityFilter> createState() => _OpacityFilterState();
}

class _OpacityFilterState extends State<OpacityFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(widget.opacity),
      child: Image.asset(
        'images/casper.jpg',
        colorBlendMode: BlendMode.modulate,
        color: Colors.white.withOpacity(widget.opacity),
      ),
    );
  }
}
