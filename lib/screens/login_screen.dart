import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
//Logo Image
          Image.asset(
            'assets/images/rafahedulogo.jpeg',
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 20,
          ),

//Title Text
          Text(
            'مديرية التربية والتعليم رفح',
            style: GoogleFonts.cairo(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          const SizedBox(
            height: 20,
          ),
//subtitle Text
          Text(
            'أهلاً وسهلاً بكم',
            style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
//email field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: InputBorder.none,
                    hintText: 'الايميل'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const TextField(
                textDirection: TextDirection.rtl,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: InputBorder.none,
                    hintTextDirection: TextDirection.rtl,
                    hintText: 'كلمة المرور'),
              ),
            ),
          ),
//password field
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
              child: Center(
                child: Text(
                  "تسجيل الدخول",
                  style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
//sign in button
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'إذا لم تكن عضواً فيمكنك',
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'التسجيل',
                style: GoogleFonts.cairo(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
//sign up text
        ],
      )),
    );
  }
}
