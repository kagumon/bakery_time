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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA1plNvIZ8WaJ8nM-ErM7v0oK0w6doLxNk',
    appId: '1:1025746760669:web:5097b32857f157f2f7bc34',
    messagingSenderId: '1025746760669',
    projectId: 'bakery-time',
    authDomain: 'bakery-time.firebaseapp.com',
    storageBucket: 'bakery-time.appspot.com',
    measurementId: 'G-3M9BW6QGBR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt0tK-ctxtzGUQk48Ar5XN0nXjABYj1lI',
    appId: '1:1025746760669:android:fa1e04eec9597465f7bc34',
    messagingSenderId: '1025746760669',
    projectId: 'bakery-time',
    storageBucket: 'bakery-time.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs1rVaWWwW46hPn54w6o9TpcagA-s4Ntc',
    appId: '1:1025746760669:ios:5afe8019fa055795f7bc34',
    messagingSenderId: '1025746760669',
    projectId: 'bakery-time',
    storageBucket: 'bakery-time.appspot.com',
    iosBundleId: 'com.example.bakeryTime',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs1rVaWWwW46hPn54w6o9TpcagA-s4Ntc',
    appId: '1:1025746760669:ios:5afe8019fa055795f7bc34',
    messagingSenderId: '1025746760669',
    projectId: 'bakery-time',
    storageBucket: 'bakery-time.appspot.com',
    iosBundleId: 'com.example.bakeryTime',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1plNvIZ8WaJ8nM-ErM7v0oK0w6doLxNk',
    appId: '1:1025746760669:web:fd107f98a71f3c86f7bc34',
    messagingSenderId: '1025746760669',
    projectId: 'bakery-time',
    authDomain: 'bakery-time.firebaseapp.com',
    storageBucket: 'bakery-time.appspot.com',
    measurementId: 'G-SBCMD7K88Y',
  );

}