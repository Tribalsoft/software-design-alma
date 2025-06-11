import 'package:flutter/material.dart';
import '../models/categories_model.dart';

class CategoriesCard extends StatelessWidget {
  final Categories categories;

  const CategoriesCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(categories.name,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: const Icon(Icons.shopping_bag),
        onTap: () {
          // Aquí podrías agregar la lógica para ver detalle o añadir al carrito
        },
      ),
    );
  }
}
