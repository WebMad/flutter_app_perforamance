import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  const ProgressButton({super.key});

  @override
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        final value = _animationController.value;

        return CustomPaint(
          painter: ProgressButtonPainter(value),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: const [Colors.black, Colors.orange],
                  stops: [value, 0.0],
                ).createShader(bounds);
              },
              child: const Center(
                child: Text(
                  "Some text",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShaderTextPainter extends CustomPainter {
  final double progress;

  ShaderTextPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(
        Offset.zero & size,
        Paint()
          ..blendMode = BlendMode.srcIn
          ..shader = LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [Colors.black, Colors.orange],
            stops: [progress, 0.0],
          ).createShader(Offset.zero & size));

    TextPainter(
      text: const TextSpan(text: "dsd"),
    ).paint(canvas, Offset.zero);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ShaderTextPainter oldDelegate) =>
      progress != oldDelegate.progress;
}

class ProgressButtonPainter extends CustomPainter {
  final double progress;

  ProgressButtonPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & Size(size.width, size.height),
        const Radius.circular(12),
      ),
      Paint()..color = Colors.black,
    );

    canvas.clipRRect(
      RRect.fromRectAndRadius(
        Offset.zero & Size(size.width, size.height),
        const Radius.circular(12),
      ),
    );

    canvas.drawRect(
      Offset.zero & Size(size.width * progress, size.height),
      Paint()..color = Colors.orange,
    );
  }

  @override
  bool shouldRepaint(covariant ProgressButtonPainter oldDelegate) =>
      progress != oldDelegate.progress;
}
