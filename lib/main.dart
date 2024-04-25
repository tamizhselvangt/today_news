import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_today/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:day_today/utilities/selectedDomain.dart';
import 'pages/mainPages/HomePage.dart';
import 'pages/Example.dart';
import 'pages/introPage.dart';
import 'package:provider/provider.dart';
import 'package:day_today/pages/finace/forexPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true
  );
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
        home: Introduction(),
        // home: HomePage(),
        // home: ExamplePage(),
        // home: ForexPage(),
      ),
    );
  }
}

