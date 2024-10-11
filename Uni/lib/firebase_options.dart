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
    apiKey: 'AIzaSyDX9lFicLIqns-MhoGeaxXR5w-7pnTCec0',
    appId: '1:536841467374:web:74319c195b629ae776caff',
    messagingSenderId: '536841467374',
    projectId: 'usearch-ba127',
    authDomain: 'usearch-ba127.firebaseapp.com',
    storageBucket: 'usearch-ba127.appspot.com',
    measurementId: 'G-BBJNNF91LW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMnGTtilqQZmMSk5dF3_lSIeIGZYlAEeE',
    appId: '1:536841467374:android:5f119fa83d1fac5776caff',
    messagingSenderId: '536841467374',
    projectId: 'usearch-ba127',
    storageBucket: 'usearch-ba127.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcBpzw70Hh-zH5NisZaU6WL8iqn7c9Fs0',
    appId: '1:536841467374:ios:32f4d2db60a10f1d76caff',
    messagingSenderId: '536841467374',
    projectId: 'usearch-ba127',
    storageBucket: 'usearch-ba127.appspot.com',
    iosBundleId: 'com.example.uni',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcBpzw70Hh-zH5NisZaU6WL8iqn7c9Fs0',
    appId: '1:536841467374:ios:32f4d2db60a10f1d76caff',
    messagingSenderId: '536841467374',
    projectId: 'usearch-ba127',
    storageBucket: 'usearch-ba127.appspot.com',
    iosBundleId: 'com.example.uni',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDX9lFicLIqns-MhoGeaxXR5w-7pnTCec0',
    appId: '1:536841467374:web:478d942358dba59476caff',
    messagingSenderId: '536841467374',
    projectId: 'usearch-ba127',
    authDomain: 'usearch-ba127.firebaseapp.com',
    storageBucket: 'usearch-ba127.appspot.com',
    measurementId: 'G-EHSFRZRPSS',
  );

}