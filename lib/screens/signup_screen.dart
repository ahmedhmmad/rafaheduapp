import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();

    Future signUp() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.of(context).pushNamed('/');
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo Image

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
                    'تسجيل عضوية جديدة',
                    style: GoogleFonts.cairo(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //name field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'الاسم ';
                        },
                        controller: _nameController,
                        textDirection: TextDirection.rtl,
                        decoration: const InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintText: 'الاسم'),
                      ),
                    ),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
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
                  //Confirm Password field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'أدخل كلمة المرور';
                          } else if (value != _passwordController.text)
                            return 'كلمة المرور غير متطابقة';
                        },
                        controller: _confirmPasswordController,
                        textDirection: TextDirection.rtl,
                        obscureText: true,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'تأكيد كلمة المرور'),
                      ),
                    ),
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
                          signUp();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            "تسجيل ",
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
                ],
              ),
            ),
          ),
        )));
  }
}
