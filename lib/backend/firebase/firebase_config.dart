import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7B5wJ2gVpHGH3ALjHVrI40_1i-8v_zt8",
            authDomain: "mykomodov2-72979.firebaseapp.com",
            projectId: "mykomodov2-72979",
            storageBucket: "mykomodov2-72979.appspot.com",
            messagingSenderId: "285616272501",
            appId: "1:285616272501:web:ec51e8068c1a1e152df43c"));
  } else {
    await Firebase.initializeApp();
  }
}
