import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'access/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyDbQ23RiuSSrRwP4Uway3VFB6HNMYGO8oE",
        appId: "1:665369848960:web:94dbc855812e8dcf458a65",
        messagingSenderId: "665369848960",
        projectId: "metricsrockapp",
      databaseURL: "https://metricsrockapp-default-rtdb.firebaseio.com",)
  );
  runApp(GetMaterialApp(
    title: "Admin - Metricsrock",
    theme: ThemeData(
      backgroundColor: Colors.white,
      primaryColor: appPrimary,
      primarySwatch: appPrimary,
    ),
    home: splash(),
  ));
}
MaterialColor appPrimary = MaterialColor(0xFF05232D, <int, Color>{
  50: Color.fromRGBO(5, 35, 45, 1),
  100: Color.fromRGBO(5, 35, 45, 1),
  200: Color.fromRGBO(5, 35, 45, 1),
  300: Color.fromRGBO(5, 35, 45, 1),
  400: Color.fromRGBO(5, 35, 45, 1),
  500: Color.fromRGBO(5, 35, 45, 1),
  600: Color.fromRGBO(5, 35, 45, 1),
  700: Color.fromRGBO(5, 35, 45, 1),
  800: Color.fromRGBO(5, 35, 45, 1),
  900: Color.fromRGBO(5, 35, 45, 1),
});
