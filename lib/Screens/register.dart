import 'package:chat_app/Screens/widget/register_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 92, 136),
        body: RegisterBody());
  }
}
