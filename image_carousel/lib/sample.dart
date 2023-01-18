import 'package:flutter/material.dart';

class ImageTest extends StatefulWidget {
  const ImageTest({Key? key}) : super(key: key);

  @override
  State<ImageTest> createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  final PageController _controller = PageController();
  final List<int> _list = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: _controller,
              children: _list
                  .map((e) => GestureDetector(
                onLongPress: () {
                  int nextPage = _list.length + 1;

                  setState(() {
                    _list.add(nextPage);
                  });

                  _controller.animateToPage(nextPage,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.red[e * 100],
                    child: Center(
                        child: Text(
                          '$e',
                          style: const TextStyle(color: Colors.white),
                          textScaleFactor: 1.5,
                        ))),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}