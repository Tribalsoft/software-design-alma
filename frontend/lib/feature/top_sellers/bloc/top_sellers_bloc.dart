import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../product_model.dart';
import 'top_sellers_event.dart';
import 'top_sellers_state.dart';

class TopSellersBloc extends Bloc<TopSellersEvent, TopSellersState> {
  TopSellersBloc() : super(TopSellersLoading()) {
    on<FetchTopSellers>(_onFetchTopSellers);
  }

  Future<void> _onFetchTopSellers(
    FetchTopSellers event,
    Emitter<TopSellersState> emit,
  ) async {
    emit(TopSellersLoading());
    try {
      // Endpoint Mocki.io de ejemplo (recuerda crear tu endpoint en https://mocki.io)
      final url = Uri.parse('https://mocki.io/v1/0f5003d9-2ca1-4717-8547-f01ce3092fac');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final products = data.map((e) => Product.fromJson(e)).toList();
        emit(TopSellersLoaded(products));
      } else {
        emit(const TopSellersError('Error al cargar los productos.'));
      }
    } catch (e) {
      emit(TopSellersError(e.toString()));
    }
  }
}
