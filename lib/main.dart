import 'package:chat_app/Screens/login.dart';
import 'package:chat_app/Screens/register.dart';
import 'package:chat_app/Screens/widget/chat_screen_body.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "ChatScreen": (context) {
          return ChatScreenBody();
        },
        "RegisterScreen": (context) {
          return RegisterScreen();
        },
        "LoginView": (context) {
          return LoginView();
        }
      },
      home: RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
