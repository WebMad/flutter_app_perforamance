import 'package:app_performance/src/progress_button/progress_button.dart';
import 'package:flutter/material.dart';

class ProgressButtonScreen extends StatelessWidget {
  const ProgressButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress button with ClipRRect"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            ProgressButton(),
            SizedBox(height: 20),
            ProgressButton(),
            SizedBox(height: 20),
            ProgressButton(),
            SizedBox(height: 20),
            ProgressButton(),
          ],
        ),
      ),
    );
  }
}
