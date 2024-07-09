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
    apiKey: 'AIzaSyBffo9yg-z3ZlGgVDQF_DcJowAQAidC0wQ',
    appId: '1:878162306785:web:fc2c50bcb1c9288805f9a0',
    messagingSenderId: '878162306785',
    projectId: 'musicapp-516c4',
    authDomain: 'musicapp-516c4.firebaseapp.com',
    storageBucket: 'musicapp-516c4.appspot.com',
    measurementId: 'G-WBY6CH2Z1X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiDFl99VKlgJDASei0aCQWec6mOO26948',
    appId: '1:878162306785:android:60a23c66fb5a57af05f9a0',
    messagingSenderId: '878162306785',
    projectId: 'musicapp-516c4',
    storageBucket: 'musicapp-516c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDo_ygdpKwjpg9H8WrgGTJZSyv_vgLu9pI',
    appId: '1:878162306785:ios:df4c0cc3dfd4bf2b05f9a0',
    messagingSenderId: '878162306785',
    projectId: 'musicapp-516c4',
    storageBucket: 'musicapp-516c4.appspot.com',
    iosBundleId: 'com.example.musicapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDo_ygdpKwjpg9H8WrgGTJZSyv_vgLu9pI',
    appId: '1:878162306785:ios:df4c0cc3dfd4bf2b05f9a0',
    messagingSenderId: '878162306785',
    projectId: 'musicapp-516c4',
    storageBucket: 'musicapp-516c4.appspot.com',
    iosBundleId: 'com.example.musicapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBffo9yg-z3ZlGgVDQF_DcJowAQAidC0wQ',
    appId: '1:878162306785:web:dcf47a60e936109c05f9a0',
    messagingSenderId: '878162306785',
    projectId: 'musicapp-516c4',
    authDomain: 'musicapp-516c4.firebaseapp.com',
    storageBucket: 'musicapp-516c4.appspot.com',
    measurementId: 'G-RQF0MZHESD',
  );
}
