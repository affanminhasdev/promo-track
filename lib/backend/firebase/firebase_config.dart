import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIZkk4Oi4wCCoDfTL7UTa4HLnpl62GNJE",
            authDomain: "localeaz.firebaseapp.com",
            projectId: "localeaz",
            storageBucket: "localeaz.appspot.com",
            messagingSenderId: "967152276842",
            appId: "1:967152276842:web:6fbe96575665c61e6f4113",
            measurementId: "G-VT6D5G5YNW"));
  } else {
    await Firebase.initializeApp();
  }
}
