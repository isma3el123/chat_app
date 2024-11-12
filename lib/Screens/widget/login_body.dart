import 'package:chat_app/core/widgets/custom_button.dart';
import 'package:chat_app/core/widgets/custom_textbuttom.dart';
import 'package:chat_app/core/widgets/textfaild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/widgets/util/validation.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        Navigator.of(context)
            .pushReplacementNamed("ChatScreen", arguments: email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successfully")),
        );
      } on FirebaseAuthException catch (e) {
        String errorMsg;
        if (e.code == 'user-not-found') {
          errorMsg = "No user found for that email.";
        } else if (e.code == 'wrong-password') {
          errorMsg = "Wrong password provided.";
        } else {
          errorMsg = "Login failed. Please try again.";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 92, 136),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
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
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFaild(
                      hintText: "Email",
                      onchange: (data) => email = data,
                      obscureText: false,
                      validator: FormValidation.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFaild(
                      hintText: "Password",
                      onchange: (data) => password = data,
                      obscureText: true,
                      validator: FormValidation.validatePassword,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: _login,
                      textColor: const Color.fromARGB(255, 19, 54, 82),
                      text: "Login",
                      background: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("RegisterScreen");
                          },
                          text: "Register",
                          textColor: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
