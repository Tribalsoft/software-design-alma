import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/category_error_view.dart';
import '../../widgets/category_initial_view.dart';
import '../../widgets/category_loaded_view.dart';
import '../../widgets/category_loading_view.dart';
import '../category/category_bloc.dart';
import '../category/category_state.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías')),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            return const CategoryInitialView();
          } else if (state is CategoryLoading) {
            return const CategoryLoadingView();
          } else if (state is CategoryLoaded) {
            return CategoryLoadedView(categories: state.categories);
          } else if (state is CategoryError) {
            return CategoryErrorView(message: state.message);
          } else {
            return const SizedBox.shrink(); // fallback
          }
        },
      ),
    );
  }
}
