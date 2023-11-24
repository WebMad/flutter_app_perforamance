import 'dart:ui';

import 'package:app_performance/src/listview_rendering/listview_rendering_screen.dart';
import 'package:app_performance/src/opacity/opacity_screen.dart';
import 'package:app_performance/src/progress_button/progress_button_screen.dart';
import 'package:app_performance/src/radar/radar_screen.dart';
import 'package:app_performance/src/shader_compilation/shader_compilation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter app performance"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              IconButton(
                iconSize: 100,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListViewRenderingScreen(),
                    ),
                  );
                },
                icon: const Column(
                  children: [
                    Icon(Icons.list_alt),
                    Text("Low perf ListView"),
                  ],
                ),
              ),
              IconButton(
                iconSize: 100,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProgressButtonScreen(),
                    ),
                  );
                },
                icon: const Column(
                  children: [
                    Icon(Icons.smart_button),
                    Text("SaveLayer example"),
                  ],
                ),
              ),
              IconButton(
                iconSize: 100,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OpacityScreen(),
                    ),
                  );
                },
                icon: const Column(
                  children: [
                    Icon(Icons.opacity),
                    Text("Opacity example"),
                  ],
                ),
              ),
              IconButton(
                iconSize: 100,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RadarScreen(),
                    ),
                  );
                },
                icon: const Column(
                  children: [
                    Icon(Icons.radar),
                    Text("Repaint boundary example"),
                  ],
                ),
              ),
              IconButton(
                iconSize: 100,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ShaderCompilationScreen(),
                    ),
                  );
                },
                icon: const Column(
                  children: [
                    Icon(Icons.roller_shades_rounded),
                    Text("Shader compilation"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
