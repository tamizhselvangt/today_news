import 'package:flutter/material.dart';
import 'package:day_today/utilities/selectedDomain.dart';
import 'pages/mainPages/HomePage.dart';
import 'pages/Example.dart';
import 'pages/introPage.dart';
import 'package:provider/provider.dart';
import 'package:day_today/pages/finace/forexPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedDomain()),
      ],
      child: MaterialApp(
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
        // home: ForexPage(),
      ),
    );
  }
}

