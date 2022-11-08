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
    apiKey: 'AIzaSyAevSiUuUxe2edqxT8AV2sbfDjs5eXFGzg',
    appId: '1:810929549053:web:dbcd1771179f24befd9894',
    messagingSenderId: '810929549053',
    projectId: 'punditv-afaa5',
    authDomain: 'punditv-afaa5.firebaseapp.com',
    storageBucket: 'punditv-afaa5.appspot.com',
    measurementId: 'G-W4EBRCMFY7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlBn6e3TD6SL8abQ24z9lTXnLcdcMlWvA',
    appId: '1:810929549053:android:2bb9bf7b682529ccfd9894',
    messagingSenderId: '810929549053',
    projectId: 'punditv-afaa5',
    storageBucket: 'punditv-afaa5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTgn5VBiQmhajspXo9epWjcMZMflZCz7g',
    appId: '1:810929549053:ios:f895f6d9a0f298cffd9894',
    messagingSenderId: '810929549053',
    projectId: 'punditv-afaa5',
    storageBucket: 'punditv-afaa5.appspot.com',
    iosClientId: '810929549053-c1u9fe4c5okruacu5q9mt7s6tuddu12i.apps.googleusercontent.com',
    iosBundleId: 'com.example.punditv',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTgn5VBiQmhajspXo9epWjcMZMflZCz7g',
    appId: '1:810929549053:ios:f895f6d9a0f298cffd9894',
    messagingSenderId: '810929549053',
    projectId: 'punditv-afaa5',
    storageBucket: 'punditv-afaa5.appspot.com',
    iosClientId: '810929549053-c1u9fe4c5okruacu5q9mt7s6tuddu12i.apps.googleusercontent.com',
    iosBundleId: 'com.example.punditv',
  );
}