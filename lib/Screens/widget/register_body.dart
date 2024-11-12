import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_textbuttom.dart';
import 'package:chat_app/core/widgets/textfaild.dart';
import 'package:chat_app/core/widgets/util/validation.dart'; // استيراد كلاس التحقق
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _SigninScreenBodyState();
}

class _SigninScreenBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool _isLoading = false; // لعرض مؤشر التحميل

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/images/scholar.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    "Scholar Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFaild(
                    obscureText: false,
                    hintText: "Email",
                    onchange: (value) => email = value,
                    validator: FormValidation.validateEmail,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFaild(
                    obscureText: true,
                    hintText: "Password",
                    onchange: (value) => password = value,
                    validator: FormValidation.validatePassword,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true; // تفعيل مؤشر التحميل
                              });
                              try {
                                await register();
                                Navigator.of(context).pushReplacementNamed(
                                    "ChatScreen",
                                    arguments: email);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Register Successfully")),
                                );
                              } on FirebaseAuthException catch (e) {
                                String errorMsg;
                                if (e.code == 'weak-password') {
                                  errorMsg = "Weak password";
                                } else if (e.code == 'email-already-in-use') {
                                  errorMsg =
                                      "The account already exists for that email.";
                                } else {
                                  errorMsg =
                                      "Registration failed. Please try again.";
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(errorMsg)),
                                );
                              } finally {
                                setState(() {
                                  _isLoading = false; // إيقاف مؤشر التحميل
                                });
                              }
                            }
                          },
                    textColor: const Color.fromARGB(255, 19, 54, 82),
                    text: _isLoading
                        ? "Loading..."
                        : "Register", // عرض النص المناسب
                    background: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("LoginView");
                        },
                        text: "Login",
                        textColor: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential> register() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
