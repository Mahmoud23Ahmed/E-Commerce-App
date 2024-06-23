import 'package:e_commerce/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCB30_t0tlDzC4kbIS26H46OmCdXedqNvo",
      appId: "1:956811135781:android:7bdd220b4d8b6bad6d68cc",
      messagingSenderId: "956811135781",
      projectId: "e-commerce-app-310f1",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
