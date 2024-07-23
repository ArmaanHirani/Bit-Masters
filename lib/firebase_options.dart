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
    apiKey: 'AIzaSyDmmrw5AH6tpmBB0P6fyKbDt8WOkJZeV_M',
    appId: '1:1017975941209:web:e3d902eb09f2d43d7da948',
    messagingSenderId: '1017975941209',
    projectId: 'bit-masters-task-manager',
    authDomain: 'bit-masters-task-manager.firebaseapp.com',
    storageBucket: 'bit-masters-task-manager.appspot.com',
    measurementId: 'G-76LL0C7E61',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnH3uj57Uul2F9siVMLDJoPiMI11Yc3cU',
    appId: '1:1017975941209:android:79e8825b5490799c7da948',
    messagingSenderId: '1017975941209',
    projectId: 'bit-masters-task-manager',
    storageBucket: 'bit-masters-task-manager.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6xugBHZ0_qNxJm5k-pZSzivjfPQPYmgE',
    appId: '1:1017975941209:ios:7544cd94c3cd17a27da948',
    messagingSenderId: '1017975941209',
    projectId: 'bit-masters-task-manager',
    storageBucket: 'bit-masters-task-manager.appspot.com',
    iosBundleId: 'com.example.taskManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6xugBHZ0_qNxJm5k-pZSzivjfPQPYmgE',
    appId: '1:1017975941209:ios:8e17726aabd3cc8f7da948',
    messagingSenderId: '1017975941209',
    projectId: 'bit-masters-task-manager',
    storageBucket: 'bit-masters-task-manager.appspot.com',
    iosBundleId: 'com.example.taskManager.RunnerTests',
  );
}