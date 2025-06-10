import 'package:flutter/material.dart';
import '../models/categories_model.dart';
import '../widgets/categories_card.dart';

class HomeView extends StatelessWidget {
  final List<Categories> categories;

  const HomeView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoriesCard(categories: categories[index]);
            },
          ),
        ),
      ],
    );
  }
}
