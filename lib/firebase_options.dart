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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4KL3oN2eDUBzm8A8LSaTbkLjdMNdxbr8',
    appId: '1:871504080914:android:6d2d451468948a20e068cb',
    messagingSenderId: '871504080914',
    projectId: 'authentication-project-27946',
    storageBucket: 'authentication-project-27946.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1tg5XQ1p4e--LuFLdeQ_W7VEaDGb6yAg',
    appId: '1:871504080914:ios:45f055b310377336e068cb',
    messagingSenderId: '871504080914',
    projectId: 'authentication-project-27946',
    storageBucket: 'authentication-project-27946.appspot.com',
    androidClientId: '871504080914-j967sn4f2no70dpk6l3fd9n9bkbmmo9c.apps.googleusercontent.com',
    iosClientId: '871504080914-4a3iau0f257ljjv150e56pdup191k7hv.apps.googleusercontent.com',
    iosBundleId: 'com.example.companyTest',
  );
}
