import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Code Factory'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              if (controller != null) {
                controller?.goBack();
              }
            },
            icon: const Icon(
              Icons.navigate_before,
            )
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (controller != null) {
                controller?.loadUrl('https://blog.codefactory.ai');
              }
            },
            icon: const Icon(
              Icons.home,
            )
          ),
          IconButton(
            onPressed: () {
              if (controller != null) {
                controller?.goForward();
              }
            },
            icon: const Icon(
              Icons.navigate_next
            )
          )
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: 'https://blog.codefactory.ai',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}