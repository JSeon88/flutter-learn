import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final List<Widget> list = [1,2,3,4,5].map(
          (number) => Image.asset('asset/img/image_$number.jpeg',
          fit: BoxFit.cover)
          ).toList();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 3),
        (timer) {
          int? nextPage = pageController.page?.toInt();

          if (nextPage == null) {
            return;
          }

          if (nextPage == list.length-1) {
            nextPage = 0;
          } else {
            nextPage++;
          }
          pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onNewImgPressed,
            icon: const Icon(
                Icons.file_upload
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: list,
      ),
    );
  }

  void onNewImgPressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery
    );

    if ( image != null) {
      setState(() {
        list.add(Image.file(File(image.path),
            fit: BoxFit.cover));
      });
    }
  }
}