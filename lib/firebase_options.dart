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
    apiKey: 'AIzaSyCsRi3YHDWZjQJJCPSnmDaHtLHQQHQM4D8',
    appId: '1:256065113823:web:77b4bf225c748a4592e36a',
    messagingSenderId: '256065113823',
    projectId: 'edema-detection',
    authDomain: 'edema-detection.firebaseapp.com',
    storageBucket: 'edema-detection.appspot.com',
    measurementId: 'G-GZVWCSRMZR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZdHpthmvGrKYWUp3Qsi7EkVapaWRZFsg',
    appId: '1:256065113823:android:abd46487c3f3840392e36a',
    messagingSenderId: '256065113823',
    projectId: 'edema-detection',
    storageBucket: 'edema-detection.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAj8FmDtyUVaNr1I1NK02weJ8dnXNGHD7A',
    appId: '1:256065113823:ios:5d8c62d72428482892e36a',
    messagingSenderId: '256065113823',
    projectId: 'edema-detection',
    storageBucket: 'edema-detection.appspot.com',
    iosBundleId: 'com.example.edemadetection',
  );
}
