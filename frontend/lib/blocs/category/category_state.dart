import 'package:equatable/equatable.dart';
import '../models/category_model.dart'; // Aquí el modelo es Product

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Product> products;

  const CategoryLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
