import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBNeUV-vTt_db7dJuKJV-Rrc69AgLEXBdc",
            authDomain: "flutter-diary-9d25d.firebaseapp.com",
            projectId: "flutter-diary-9d25d",
            storageBucket: "flutter-diary-9d25d.firebasestorage.app",
            messagingSenderId: "592701245398",
            appId: "1:592701245398:web:2bef624001c5dfc3148677",
            measurementId: "G-66MQCR30PJ"));
  } else {
    await Firebase.initializeApp();
  }
}
