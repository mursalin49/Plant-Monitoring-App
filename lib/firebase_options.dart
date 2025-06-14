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
    apiKey: 'AIzaSyAJ3aHZs7grlOWzFcDu2Hcor0zibDLfgdo',
    appId: '1:987030862161:android:d19c0a7acf8b1e9dfbbb70',
    messagingSenderId: '987030862161',
    projectId: 'iotproject-8d4de',
    storageBucket: 'iotproject-8d4de.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDCRv_Spoh9RpQPVWv2vnF6K7WOy3PdHg',
    appId: '1:987030862161:ios:0926d074e938df32fbbb70',
    messagingSenderId: '987030862161',
    projectId: 'iotproject-8d4de',
    storageBucket: 'iotproject-8d4de.firebasestorage.app',
    iosBundleId: 'com.example.iotproject',
  );
}

// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
//
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       throw UnsupportedError(
//         'DefaultFirebaseOptions have not been configured for web - '
//         'you can reconfigure this by running the FlutterFire CLI again.',
//       );
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for macos - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyAJ3aHZs7grlOWzFcDu2Hcor0zibDLfgdo',
//     appId: '1:987030862161:android:d19c0a7acf8b1e9dfbbb70',
//     messagingSenderId: '987030862161',
//     projectId: 'iotproject-8d4de',
//     databaseURL: 'https://iotproject-8d4de-default-rtdb.firebaseio.com/',
//     storageBucket: 'iotproject-8d4de.appspot.com',
//   );
//
//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyDDCRv_Spoh9RpQPVWv2vnF6K7WOy3PdHg',
//     appId: '1:987030862161:ios:0926d074e938df32fbbb70',
//     messagingSenderId: '987030862161',
//     projectId: 'iotproject-8d4de',
//     databaseURL: 'https://iotproject-8d4de-default-rtdb.firebaseio.com/',
//     storageBucket: 'iotproject-8d4de.appspot.com',
//     iosBundleId: 'com.example.iotproject',
//   );
// }
