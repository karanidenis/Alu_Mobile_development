// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAcX0x9qr_6-OSIwDKl7o3gnVah5NBJbUM',
    appId: '1:216408854473:web:73a75542272f2597f02218',
    messagingSenderId: '216408854473',
    projectId: 'mobile-weather-fb042',
    authDomain: 'mobile-weather-fb042.firebaseapp.com',
    databaseURL: 'https://mobile-weather-fb042-default-rtdb.firebaseio.com',
    storageBucket: 'mobile-weather-fb042.appspot.com',
    measurementId: 'G-1S4TP3PWTL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9W4lnyfbxJlaezJO0ab8qXRnDrF4dD38',
    appId: '1:216408854473:android:26d81e360a66d020f02218',
    messagingSenderId: '216408854473',
    projectId: 'mobile-weather-fb042',
    databaseURL: 'https://mobile-weather-fb042-default-rtdb.firebaseio.com',
    storageBucket: 'mobile-weather-fb042.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBhskRugYx1CAKRZe0cgdwLGFzNMln0FU',
    appId: '1:216408854473:ios:ef53f485094c63d8f02218',
    messagingSenderId: '216408854473',
    projectId: 'mobile-weather-fb042',
    databaseURL: 'https://mobile-weather-fb042-default-rtdb.firebaseio.com',
    storageBucket: 'mobile-weather-fb042.appspot.com',
    androidClientId: '216408854473-u1uolahg1m3i4udhij1n558ue19svjek.apps.googleusercontent.com',
    iosClientId: '216408854473-mve13ppre05e0dgj98ff7lbsota605na.apps.googleusercontent.com',
    iosBundleId: 'com.example.helloApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBhskRugYx1CAKRZe0cgdwLGFzNMln0FU',
    appId: '1:216408854473:ios:f4c47b58e83b2da6f02218',
    messagingSenderId: '216408854473',
    projectId: 'mobile-weather-fb042',
    databaseURL: 'https://mobile-weather-fb042-default-rtdb.firebaseio.com',
    storageBucket: 'mobile-weather-fb042.appspot.com',
    androidClientId: '216408854473-u1uolahg1m3i4udhij1n558ue19svjek.apps.googleusercontent.com',
    iosClientId: '216408854473-7c0nhu9g6c46pl66mv6ggaali1082gb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.helloApp.RunnerTests',
  );
}
