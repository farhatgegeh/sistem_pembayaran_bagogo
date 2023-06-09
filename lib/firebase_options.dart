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
    apiKey: 'AIzaSyAKosC6rm9S3zdmPHbc5SI3ob-9_fht2Bc',
    appId: '1:572352720804:web:b4f102aef88d3955ae1b31',
    messagingSenderId: '572352720804',
    projectId: 'sistem-pembayaran-b8caa',
    authDomain: 'sistem-pembayaran-b8caa.firebaseapp.com',
    databaseURL: 'https://sistem-pembayaran-b8caa-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sistem-pembayaran-b8caa.appspot.com',
    measurementId: 'G-LLXEEQ1FLD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAw-gAbM38u-riLLqwJutjfy5YP0zH0F6E',
    appId: '1:572352720804:android:762d39db54f2d388ae1b31',
    messagingSenderId: '572352720804',
    projectId: 'sistem-pembayaran-b8caa',
    databaseURL: 'https://sistem-pembayaran-b8caa-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sistem-pembayaran-b8caa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCihO0Uyx-4KCAzezwDpfxQBVOj9-35Iss',
    appId: '1:572352720804:ios:9480996b6dea9937ae1b31',
    messagingSenderId: '572352720804',
    projectId: 'sistem-pembayaran-b8caa',
    databaseURL: 'https://sistem-pembayaran-b8caa-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'sistem-pembayaran-b8caa.appspot.com',
    iosClientId: '572352720804-p3cd5de3p272mecss0mslddlbl5jl7jd.apps.googleusercontent.com',
    iosBundleId: 'com.example.aplikasiPembayaranBagogo',
  );
}
