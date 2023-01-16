import 'package:basic_widgets/button.dart';
import 'package:basic_widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'gesture_detector_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyGestureDetectorWidget(),
        ),
      ),
    );
  }

}

