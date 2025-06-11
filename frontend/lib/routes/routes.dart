import 'package:design_alma/feature/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../app/main_scaffold.dart';

class AppRoute {
  static const String home = '/';
  static const String profile = '/profile';

  final Map<String, WidgetBuilder> routes = {
    AppRoute.home: (context) => MainScaffold(),
    AppRoute.profile: (context) => const ProfilePage(),
  };
}
