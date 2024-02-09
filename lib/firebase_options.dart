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
    apiKey: 'AIzaSyA6o-Bvrw5ne7h6FRiUXHj_i_KmgnGGkKI',
    appId: '1:8962504628:web:440a7019c9f6b0c77fe4e1',
    messagingSenderId: '8962504628',
    projectId: 'movie-app-e11c1',
    authDomain: 'movie-app-e11c1.firebaseapp.com',
    storageBucket: 'movie-app-e11c1.appspot.com',
    measurementId: 'G-GJRWJGZECL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8VTuIEMrTCV9FxA5IuAwoOjGMXr2_8bg',
    appId: '1:8962504628:android:b2daf87e231605927fe4e1',
    messagingSenderId: '8962504628',
    projectId: 'movie-app-e11c1',
    storageBucket: 'movie-app-e11c1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWRRgwUAva1APT5y99u_GgCr--5rDHtas',
    appId: '1:8962504628:ios:935db5909c51c0487fe4e1',
    messagingSenderId: '8962504628',
    projectId: 'movie-app-e11c1',
    storageBucket: 'movie-app-e11c1.appspot.com',
    androidClientId: '8962504628-peppsds8qep38v7l3m02bfigrnt8ujrm.apps.googleusercontent.com',
    iosClientId: '8962504628-tidasf51h6qlbpma3n2vi9b4bu7jtkbo.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieAppWithFirebase',
  );
}
