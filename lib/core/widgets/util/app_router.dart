import 'package:chat_app/Screens/login.dart';
import 'package:chat_app/Screens/register.dart';
import 'package:chat_app/Screens/widget/chat_screen_body.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kregister = "/kregister";
  static const klogin = "/klogin";
  static const kchat = "/kchat";

  static final router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => LoginView()),
    GoRoute(path: klogin, builder: (context, state) => const LoginView()),
    GoRoute(
        path: kregister, builder: (context, state) => const RegisterScreen()),
    GoRoute(path: kchat, builder: (context, state) => ChatScreenBody()),
  ]);
}
