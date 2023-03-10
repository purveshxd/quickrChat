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
    apiKey: 'AIzaSyCzAna0e2EI0n5_aBZd6SYozKSky0TGis4',
    appId: '1:835507423082:web:2c98318917a6f75b64c713',
    messagingSenderId: '835507423082',
    projectId: 'quickrchat-cf6c5',
    authDomain: 'quickrchat-cf6c5.firebaseapp.com',
    storageBucket: 'quickrchat-cf6c5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxeptLKxRQwpOFRtI1z-G8N0FXq8gqRAM',
    appId: '1:835507423082:android:9c1a6ebdbbddadba64c713',
    messagingSenderId: '835507423082',
    projectId: 'quickrchat-cf6c5',
    storageBucket: 'quickrchat-cf6c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1FJCgQb5EsgZCOb0wDiPOfR0XavUejbs',
    appId: '1:835507423082:ios:dd0e431fd1c19c3f64c713',
    messagingSenderId: '835507423082',
    projectId: 'quickrchat-cf6c5',
    storageBucket: 'quickrchat-cf6c5.appspot.com',
    iosClientId: '835507423082-cirjfa0vfc3p1gl7a9krjdu48ejv0nkb.apps.googleusercontent.com',
    iosBundleId: 'com.example.quickrchat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1FJCgQb5EsgZCOb0wDiPOfR0XavUejbs',
    appId: '1:835507423082:ios:dd0e431fd1c19c3f64c713',
    messagingSenderId: '835507423082',
    projectId: 'quickrchat-cf6c5',
    storageBucket: 'quickrchat-cf6c5.appspot.com',
    iosClientId: '835507423082-cirjfa0vfc3p1gl7a9krjdu48ejv0nkb.apps.googleusercontent.com',
    iosBundleId: 'com.example.quickrchat',
  );
}
