import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryLoadedView extends StatelessWidget {
  final List<Category> categories;

  const CategoryLoadedView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          onTap: () {
            // Aquí podrías navegar a una pantalla de artículos por categoría
          },
        );
      },
    );
  }
}
