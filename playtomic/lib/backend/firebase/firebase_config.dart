import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAuKY2a8mftWz5peWv7JhUx57NvuC9DJlo",
            authDomain: "playtomic-intro-mobile.firebaseapp.com",
            projectId: "playtomic-intro-mobile",
            storageBucket: "playtomic-intro-mobile.appspot.com",
            messagingSenderId: "425499945564",
            appId: "1:425499945564:web:cfe67103575b67cef51499",
            measurementId: "G-H65F3WS2DK"));
  } else {
    await Firebase.initializeApp();
  }
}
