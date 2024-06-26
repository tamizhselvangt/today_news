// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBPd0kB9nC_zTIfBO-kNq2Adx38SdaufHY',
    appId: '1:927760867716:web:2cf6997a5667542553bdd1',
    messagingSenderId: '927760867716',
    projectId: 'day-today-dfdaf',
    authDomain: 'day-today-dfdaf.firebaseapp.com',
    storageBucket: 'day-today-dfdaf.appspot.com',
    measurementId: 'G-TSXGPLK21T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtYFFxyUvV5tdWOV4xsBx76tQqvXWJr-A',
    appId: '1:927760867716:android:c2eed08104ccfa7453bdd1',
    messagingSenderId: '927760867716',
    projectId: 'day-today-dfdaf',
    storageBucket: 'day-today-dfdaf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXvGbrVZPO05bB89h_nPB6tUC4mnhqrJw',
    appId: '1:927760867716:ios:1fa2885e6ad5587c53bdd1',
    messagingSenderId: '927760867716',
    projectId: 'day-today-dfdaf',
    storageBucket: 'day-today-dfdaf.appspot.com',
    androidClientId: '927760867716-t3ttc61fgfg9osda4misakg7pachians.apps.googleusercontent.com',
    iosClientId: '927760867716-v1dkqpmck9q5q6nr2tcdimi84bs235v6.apps.googleusercontent.com',
    iosBundleId: 'com.tamizhselvan.todayNews',
  );

}