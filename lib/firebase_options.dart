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
    apiKey: 'AIzaSyBNlrxk1C9TfP1Zqtfk8rGsJNV6yAw3lEk',
    appId: '1:123563750329:web:2d9e7138dd0af362a57c68',
    messagingSenderId: '123563750329',
    projectId: 'nike-store-app-f8ff2',
    authDomain: 'nike-store-app-f8ff2.firebaseapp.com',
    storageBucket: 'nike-store-app-f8ff2.appspot.com',
    measurementId: 'G-30YDP5WXS8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqkbGZPfvb2KH09-DKadIHXp45EICftdY',
    appId: '1:123563750329:android:51ffb672dcca2862a57c68',
    messagingSenderId: '123563750329',
    projectId: 'nike-store-app-f8ff2',
    storageBucket: 'nike-store-app-f8ff2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0_U2Qs01XbPSzxPvJdY6AmUmcMiZMFSw',
    appId: '1:123563750329:ios:886a2df45d9be1efa57c68',
    messagingSenderId: '123563750329',
    projectId: 'nike-store-app-f8ff2',
    storageBucket: 'nike-store-app-f8ff2.appspot.com',
    androidClientId: '123563750329-j7ds4pcc4sml0t5iejvujp606r07m6so.apps.googleusercontent.com',
    iosClientId: '123563750329-mi6l4vuofa1lujo21m9pthmd0brclodd.apps.googleusercontent.com',
    iosBundleId: 'com.example.nikeAppVendors',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0_U2Qs01XbPSzxPvJdY6AmUmcMiZMFSw',
    appId: '1:123563750329:ios:98e5ec9609b5777ca57c68',
    messagingSenderId: '123563750329',
    projectId: 'nike-store-app-f8ff2',
    storageBucket: 'nike-store-app-f8ff2.appspot.com',
    androidClientId: '123563750329-j7ds4pcc4sml0t5iejvujp606r07m6so.apps.googleusercontent.com',
    iosClientId: '123563750329-5sm2hivucjos1c2iv56gpbn0d7rq4kvb.apps.googleusercontent.com',
    iosBundleId: 'com.example.nikeAppVendors.RunnerTests',
  );
}
