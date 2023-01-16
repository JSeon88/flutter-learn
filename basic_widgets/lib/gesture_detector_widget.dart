import 'package:flutter/material.dart';

class MyGestureDetectorWidget extends StatelessWidget {
  const MyGestureDetectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('on tap');
      },
      onDoubleTap: () {
        print('on double tap');
      },
      onLongPress: () {
        print('on long press');
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        width: 100.0,
        height: 100.0,
      ),
    );
  }

}