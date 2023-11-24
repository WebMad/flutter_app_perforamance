import 'package:flutter/material.dart';
import 'dart:math' as math;

class Radar extends StatefulWidget {
  final double size;

  const Radar({
    super.key,
    this.size = 100,
  });

  @override
  State<Radar> createState() => _RadarState();
}

class _RadarState extends State<Radar> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: false);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Transform.rotate(
            angle: 2 * math.pi * _animationController.value,
            child: child,
          ),
          child: const CustomPaint(
            painter: RadarCustomPainter(0),
          ),
        ),
      ),
    );
  }
}

class RadarCustomPainter extends CustomPainter {
  static const _borderSize = 5.0;

  final double angle;

  const RadarCustomPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;

    canvas.translate(size.height / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, size.height / 2, paint);
    canvas.translate(-size.height / 2, -size.height / 2);

    final minifiedSize = Size(
      size.height - _borderSize * 2,
      size.height - _borderSize * 2,
    );

    paint.shader = const SweepGradient(
      center: FractionalOffset.center,
      colors: <Color>[
        // Colors.yellowAccent,
        Color(0xff4c8a4d),
        Color(0xff6bbf6c),
      ],
      stops: <double>[0, 1],
      startAngle: 0,
      endAngle: math.pi * 2,
      // transform: Gradient(math.pi / 2),
    ).createShader(Offset.zero & size);

    canvas.drawArc(
      const Offset(_borderSize, _borderSize) & minifiedSize,
      0,
      math.pi * 2,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
