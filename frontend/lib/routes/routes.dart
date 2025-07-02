import 'package:design_alma/feature/profile/pages/profile_page.dart';
import 'package:design_alma/feature/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String home = '/login';
  static const String profile = '/profile';
  static const String login = '/login';

  final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    profile: (context) => const PerfilPage(),
  };
}
