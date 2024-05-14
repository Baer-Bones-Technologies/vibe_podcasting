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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBYvYCnY9Giq_3zEwdVrrxdblUp6bV_1U',
    appId: '1:1097426582598:android:689edafb71a9f2fd98de47',
    messagingSenderId: '1097426582598',
    projectId: 'vibe-podcasting',
    storageBucket: 'vibe-podcasting.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1D15MvwKVZJl3ggWMIi8I62Ix4jVq5vg',
    appId: '1:1097426582598:ios:6e2ee0dd19d72ab398de47',
    messagingSenderId: '1097426582598',
    projectId: 'vibe-podcasting',
    storageBucket: 'vibe-podcasting.appspot.com',
    iosBundleId: 'com.baerhous.vibePodcasting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1D15MvwKVZJl3ggWMIi8I62Ix4jVq5vg',
    appId: '1:1097426582598:ios:6e2ee0dd19d72ab398de47',
    messagingSenderId: '1097426582598',
    projectId: 'vibe-podcasting',
    storageBucket: 'vibe-podcasting.appspot.com',
    iosBundleId: 'com.baerhous.vibePodcasting',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCh_CE7rFud_pss4YR-G7R7MjSbrnXOtoM',
    appId: '1:1097426582598:web:554bc5f3c05251b598de47',
    messagingSenderId: '1097426582598',
    projectId: 'vibe-podcasting',
    authDomain: 'vibe-podcasting.firebaseapp.com',
    storageBucket: 'vibe-podcasting.appspot.com',
    measurementId: 'G-20PTNJ497S',
  );
}
