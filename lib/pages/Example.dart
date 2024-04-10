// import 'package:firebase_core/firebase_core.dart' as Firebase;
// import 'package:flutter/material.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     runApp(MyApp());
//   } catch (e) {
//     print("Firebase initialization failed: $e");
//     runApp(ErrorApp());
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: HomePage(),
//     );
//   }
// }
//
// class ErrorApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Error App',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Error')),
//         body: Center(child: Text('Failed to connect to Firebase')),
//       ),
//     );
//   }
// }