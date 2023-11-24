import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShaderCompilationScreen extends StatefulWidget {
  const ShaderCompilationScreen({super.key});

  @override
  State<ShaderCompilationScreen> createState() =>
      _ShaderCompilationScreenState();
}

class _ShaderCompilationScreenState extends State<ShaderCompilationScreen>
    with TickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shader compilation"),
      ),
      body: Column(
        children: [
          _animationController.isAnimating
              ? AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return CustomPaint(
                      foregroundPainter:
                          MillPainter(_animationController.value),
                      child: child ?? const SizedBox(),
                    );
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 400,
                    height: 400,
                  ),
                )
              : Container(
                  color: Colors.blue,
                  width: 400,
                  height: 400,
                  child: const Center(
                    child: Text("Press the button"),
                  ),
                ),
          ElevatedButton(
            onPressed: () {
              _animationController.repeat();
              setState(() {});
            },
            child: const Text("Run animation"),
          ),
        ],
      ),
    );
  }
}

class MillPainter extends CustomPainter {
  final double rotation;

  MillPainter(this.rotation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;

    final halfHeight = size.height / 2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset(size.width / 2 - 15, halfHeight * 0.8) &
            Size(30, halfHeight * 1.2),
        const Radius.circular(12),
      ),
      paint,
    );

    paint.shader = RadialGradient(
      colors: const [
        Colors.red,
        Colors.yellow,
      ],
      stops: [
        math.min(rotation, 1 - rotation),
        math.max(rotation, 1 - rotation),
      ],
      tileMode: TileMode.repeated,
    ).createShader(
      Offset.zero & Size(30, halfHeight * 2 * rotation),
    );
    canvas.save();
    canvas.translate(halfHeight, halfHeight * 0.8 + 15);
    canvas.rotate(math.pi * 2 * rotation);
    canvas.translate(-15, 0);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & Size(30, halfHeight),
        const Radius.circular(12),
      ),
      paint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
