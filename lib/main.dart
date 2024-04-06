import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'package:get/get.dart';
import 'pages/Example.dart';
import 'pages/introPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.transparent,
        textSelectionTheme: TextSelectionThemeData(
          // selectionColor: Colors.black,
              cursorColor: Colors.black,
        )
      ),
      // home: Introduction(),
      // home: HomePage(),
      home: ExamplePage(),
    );
  }
}

