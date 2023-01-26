import 'package:flutter/material.dart';
import 'package:random_dice/const/colors.dart';
import 'package:random_dice/screen/home_screen.dart';
import 'package:random_dice/screen/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(           // Slider 위젯 관련 테마
          thumbColor: primaryColor,             // 노브 색상
          activeTickMarkColor: primaryColor,    // 노브가 이동한 트랙 색상

          // 노브가 아직 이동하지 않은 트랙 색상
          inactiveTrackColor: primaryColor.withOpacity(0.3),
        ),
        // BottomNavigationBar 위젯 관련 테마
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,      // 선택 상태 색
          unselectedItemColor: secondaryColor,  // 비선택 상태 색
          backgroundColor: backgroundColor,     // 배경
        ),
      ),
      home: RootScreen(),
    );
  }
}

