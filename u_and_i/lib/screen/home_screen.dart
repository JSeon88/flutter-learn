import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();
  final DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(    // 크퍼티노 다이얼로그 실행
      context: context,     // 보여줄 다이얼로그 빌드
      builder: (BuildContext context) {
        return Align(   // 정렬을 지정하는 위젯
          alignment: Alignment.bottomCenter,    // 아래 중간으로 정렬
          child: Container(
            color: Colors.white,
            height: 300,
            // 날짜 선택하는 다이얼로그
            child: CupertinoDatePicker(
              // 시간 제외하고 날짜만 선택하기
              mode:CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
              maximumDate: DateTime(currentTime.year, currentTime.month,
                  currentTime.day, 23, 59, 59),
            )
          ),
        );
      },
      barrierDismissible: true,   // 외부 탭할 경우 다이얼로그 닫기
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  const _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          'U&I',
          style: textTheme.headline1,
        ),
        const SizedBox(height: 16.0),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyText1,
        ),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText2,
        ),
        IconButton(
          iconSize: 60.0,
            onPressed: onHeartPressed,
            icon: const Icon(
                Icons.favorite,
                color: Colors.red,
            )
        ),
        const SizedBox(height: 16.0),
        Text(
          _calculateDate(),
          style: textTheme.headline2,
        ),
      ],
    );
  }

  String _calculateDate() {
    final DateTime now = DateTime.now();
    return 'D+${DateTime(now.year, now.month, now.day)
        .difference(firstDay).inDays + 1}';
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'asset/img/middle_image.png',
          height: MediaQuery.of(context).size.height / 2),
        )
      );
    }
}