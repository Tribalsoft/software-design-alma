import 'package:design_alma/blocs/category/category_bloc.dart';
import 'package:design_alma/blocs/category/category_event.dart';
import 'package:design_alma/blocs/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/repositories/category_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesignAlma App',
      home: HomeScreen(
        categoryRepository: categoryRepository,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final CategoryRepository categoryRepository;

  const HomeScreen({
    super.key,
    required this.categoryRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Ver Productos'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) =>
                          CategoryBloc(categoryRepository)..add(LoadProducts()),
                      child: const CategoryScreen(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
