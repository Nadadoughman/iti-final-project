import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/OnboardingScreen/intro_screen.dart';
import 'package:flutter_application_1/login/login.dart';


bool show = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD4qSyFJ1kbK_D6WNvyD440LF5IXre67os",
          appId:"1:881128949447:android:72a21b40509a5ebd0820e2",
          messagingSenderId:  "881128949447",
          projectId:"new-final-iti"));

  // final prefs = await SharedPreferences.getInstance();
  // show= await prefs.getBool("on_boarding") ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
       home: show ? IntroScreen() : const LoginScreen(),
      
    );
  }
}
