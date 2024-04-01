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
    apiKey: 'AIzaSyCmEaNnpByS88gI4JXUadyYC0UBjURIeaU',
    appId: '1:825528106452:web:0673402cb1b5fffc842a41',
    messagingSenderId: '825528106452',
    projectId: 'roadway-carsale',
    authDomain: 'roadway-carsale.firebaseapp.com',
    storageBucket: 'roadway-carsale.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEiQlN7tY196q1FLeSsZ9SDmdNJEqubds',
    appId: '1:825528106452:android:5a48e75813f161c4842a41',
    messagingSenderId: '825528106452',
    projectId: 'roadway-carsale',
    storageBucket: 'roadway-carsale.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBipVO82l_V3M8day5YM-Us0vTnDrSs9wI',
    appId: '1:825528106452:ios:7d385a26aca6dbdd842a41',
    messagingSenderId: '825528106452',
    projectId: 'roadway-carsale',
    storageBucket: 'roadway-carsale.appspot.com',
    androidClientId: '825528106452-t598hni13sd9p9cl994c8ktmeu101k3e.apps.googleusercontent.com',
    iosClientId: '825528106452-7vf374p7nrk44o2k6kf0danf5t7u4bie.apps.googleusercontent.com',
    iosBundleId: 'com.example.carSaleFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBipVO82l_V3M8day5YM-Us0vTnDrSs9wI',
    appId: '1:825528106452:ios:b254b846e774b66f842a41',
    messagingSenderId: '825528106452',
    projectId: 'roadway-carsale',
    storageBucket: 'roadway-carsale.appspot.com',
    androidClientId: '825528106452-t598hni13sd9p9cl994c8ktmeu101k3e.apps.googleusercontent.com',
    iosClientId: '825528106452-0ridhjjl27amgn00mediogdbahe3n254.apps.googleusercontent.com',
    iosBundleId: 'com.example.carSaleFirebase.RunnerTests',
  );
}
