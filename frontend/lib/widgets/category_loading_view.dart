import 'package:flutter/material.dart';

class CategoryLoadingView extends StatelessWidget {
  const CategoryLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
