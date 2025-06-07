import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_event.dart';
import 'category_state.dart';
import '../repositories/category_repository.dart';
import '../models/category_model.dart'; // el modelo `Product`

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(CategoryLoading());
      try {
        final products = await categoryRepository.getProducts();
        emit(CategoryLoaded(products));
      } catch (e) {
        emit(CategoryError('Error al cargar productos: $e'));
      }
    });
  }
}

