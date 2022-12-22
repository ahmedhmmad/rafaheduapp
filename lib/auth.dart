import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafaheduapp/screens/home_screen.dart';
import 'package:rafaheduapp/screens/login_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'حدث خطأ، يرجى المحاولة لاحقاً',
              style:
                  GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          );
        } else if (snapshot.hasData) {
          return HomeScreen();
        }
        return LoginScreen();
      },
    ));
  }
}
