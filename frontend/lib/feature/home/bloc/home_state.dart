import '../models/categories_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Categories> categories;

  HomeLoaded(this.categories);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
