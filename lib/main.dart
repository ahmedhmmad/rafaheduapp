import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rafaheduapp/auth.dart';
import 'package:rafaheduapp/screens/home_screen.dart';
import 'package:rafaheduapp/screens/login_screen.dart';
import 'package:rafaheduapp/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مديرية التربية والتعليم رفح',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Scaffold(
        body:
            Auth(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
      routes: {
        'SignUpScreen': (context) => const SignUpScreen(),
        'LoginScreen': (context) => const LoginScreen(),
        'HomeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
