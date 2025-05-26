import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../models/product_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadProducts>(_onLoadLatestProducts);
  }

  Future<void> _onLoadLatestProducts(
      LoadProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      // Simula una carga desde una API o base de datos
      await Future.delayed(const Duration(seconds: 2));
      final products = [
        Product(name: "Camisa", price: 29.000),
        Product(name: "Zapatos", price: 59.000),
      ];

      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError("No se pudieron cargar los productos"));
    }
  }
}
