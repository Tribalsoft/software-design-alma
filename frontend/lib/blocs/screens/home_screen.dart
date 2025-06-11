import 'package:flutter/material.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F2FF), // azul claro igual que productos
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: const Color(0xFF2196F3), // azul fuerte
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF42A5F5), // azul vibrante
              foregroundColor: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryScreen()),
              );
            },
            child: const Text('Ver Productos'),
          ),
        ),
      ),
    );
  }
}
