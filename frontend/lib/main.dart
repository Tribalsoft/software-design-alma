import 'package:design_alma/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    final appRoute = AppRoute();

    return MaterialApp(
      title: 'DesignAlma App',
      home: HomeScreen(
        categoryRepository: categoryRepository,
      ),
      initialRoute: '/',
      routes: appRoute.routes,
    );
  }
}
