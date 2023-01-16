import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget{
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '코드 팩토리',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        color: Colors.blue,
      ),
    );
  }
}
