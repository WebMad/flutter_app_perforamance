import 'dart:math';

import 'package:app_performance/src/radar/lowperf_radar.dart';
import 'package:app_performance/src/radar/radar.dart';
import 'package:flutter/material.dart';

class RadarScreen extends StatefulWidget {
  const RadarScreen({super.key});

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen> {
  bool isLowPerfRadar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedBuilder with RepaintBoundary"),
      ),
      body: CustomPaint(
        painter: ExpensivePainter(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              isLowPerfRadar
                  ? const LowperfRadar(size: 200)
                  : const Radar(size: 200),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLowPerfRadar = !isLowPerfRadar;
                  });
                },
                child: Text(
                  "Switch to ${isLowPerfRadar ? "high performance" : "low performance"} radar",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpensivePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Random rand = Random(12345);
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.green,
      Colors.white,
    ];
    for (int i = 0; i < 5000; i++) {
      canvas.drawCircle(
        Offset(
          rand.nextDouble() * size.width,
          rand.nextDouble() * size.height,
        ),
        10 + rand.nextDouble() * 20,
        Paint()..color = colors[rand.nextInt(colors.length)].withOpacity(0.2),
      );
    }
  }

  @override
  bool shouldRepaint(ExpensivePainter oldDelegate) => false;
}
