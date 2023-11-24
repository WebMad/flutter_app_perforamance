import 'package:flutter/material.dart';

class OpacityWidget extends StatelessWidget {
  final double opacity;

  const OpacityWidget({
    super.key,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        color: Colors.red,
        child: Image.asset('images/casper.jpg'),
      ),
    );
  }
}
