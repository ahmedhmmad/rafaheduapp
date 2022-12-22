import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rafaheduapp/main.dart';
import 'package:rafaheduapp/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                ' يرجى التأكد من اسم المستخدم',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )),
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                ' يرجى التأكد من كلمة المرور',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )),
        );
        print('Wrong password provided for that user.');
      }
    }
    Navigator.of(context).pop();
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  style: GoogleFonts.cairo(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 20,
                ),
                //subtitle Text
                Text(
                  'أهلاً وسهلاً بكم',
                  style: GoogleFonts.cairo(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                //email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'أدخل الايميل';
                      },
                      controller: _emailController,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'أدخل كلمة المرور';
                      },
                      controller: _passwordController,
                      textDirection: TextDirection.rtl,
                      obscureText: true,
                      decoration: const InputDecoration(
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(milliseconds: 300),
                              backgroundColor:
                                  Color.fromARGB(255, 242, 200, 214),
                              content: Text(
                                ' يتم التحقق من البيانات',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )),
                        );
                        signIn();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
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
                ),
                //sign in button
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   textDirection: TextDirection.rtl,
                //   children: [
                //     Text(
                //       'إذا لم تكن عضواً فيمكنك',
                //       style: GoogleFonts.cairo(
                //         color: Colors.black,
                //         fontSize: 14,
                //         fontWeight: FontWeight.w300,
                //       ),
                //     ),
                //     Text(
                //       'التسجيل',
                //       style: GoogleFonts.cairo(
                //           color: Colors.green,
                //           fontSize: 16,
                //           fontWeight: FontWeight.w300),
                //     ),
                //   ],
                // )
                //sign up text
                RichText(
                    text: TextSpan(
                        style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                        text: 'إذا لم تكن عضواً يمكنك ',
                        children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacementNamed('SignUpScreen');
                          },
                        style: GoogleFonts.cairo(
                            color: Colors.teal,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                        text: 'التسجيل',
                      )
                    ]))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
