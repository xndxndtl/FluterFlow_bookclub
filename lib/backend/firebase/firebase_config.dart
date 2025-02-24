import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDkA7FLtkwoat95qMQ4hHb9WFhQjJtOPNI",
            authDomain: "bookclub-8e08d.firebaseapp.com",
            projectId: "bookclub-8e08d",
            storageBucket: "bookclub-8e08d.appspot.com",
            messagingSenderId: "604987238080",
            appId: "1:604987238080:web:fd2131bba690386ec02f25",
            measurementId: "G-E29KH32CCJ"));
  } else {
    await Firebase.initializeApp();
  }
}
