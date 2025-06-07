import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../category/category_bloc.dart';
import '../category/category_event.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDF7),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // pon tu logo si tienes uno
                height: 120,
              ),
              const SizedBox(height: 24),
              const Text(
                'Bienvenido a DesignAlma',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<CategoryBloc>().add(LoadCategories());
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CategoryScreen()),
                  );
                },
                icon: const Icon(Icons.shopping_bag),
                label: const Text(
                  'Ver Productos',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
