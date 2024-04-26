import 'package:day_today/pages/webViewPage.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewPage(
        controller: WebViewController()..loadRequest(Uri.parse("https://www.google.com/finance/?hl=en")),
      ),
    );
  }
}
