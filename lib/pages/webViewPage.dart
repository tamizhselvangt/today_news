import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebViewPage extends StatelessWidget {
  final controller;
 WebViewPage({super.key, this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
