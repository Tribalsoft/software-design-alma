import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/category.dart';
import 'category_event.dart';
import 'category_state.dart';
import '../repositories/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryBloc(this.repository) : super(CategoryInitial()) {
    on<LoadCategories>((event, emit) async {
      emit(CategoryLoading());
      try {
        final List<Category> categories = await repository.getCategories();
        emit(CategoryLoaded(categories));
      } catch (_) {
        emit(CategoryError("Error al cargar categorías"));
      }
    });
  }
}

