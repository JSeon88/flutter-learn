import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children:
        [
          TextButton(
            // 클릭 시 실행
            onPressed: () {},
            // 스타일 지정
            style: TextButton.styleFrom(
              // 주 색상 지정
              foregroundColor: Colors.red,
            ),
            // 버튼에 넣을 위젯
            child: const Text('텍스트 버튼'),
          ),
          OutlinedButton(
            onPressed: () {  },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('아웃라인드 버튼'),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('엘레베이티드 버튼'),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home
              )
          ),
      ],
    );
  }
}
