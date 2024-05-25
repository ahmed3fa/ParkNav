import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDAPdTVUkKcXnnDLL63wBfmUMJE6N6F3_0",
            authDomain: "parkingapp2-7e705.firebaseapp.com",
            projectId: "parkingapp2-7e705",
            storageBucket: "parkingapp2-7e705.appspot.com",
            messagingSenderId: "527692250941",
            appId: "1:527692250941:web:3abce81b90101dde5c4f54",
            measurementId: "G-8S8S80GETP"));
  } else {
    await Firebase.initializeApp();
  }
}
