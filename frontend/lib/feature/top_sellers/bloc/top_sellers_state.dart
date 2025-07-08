import 'package:equatable/equatable.dart';
import '../product_model.dart';

abstract class TopSellersState extends Equatable {
  const TopSellersState();

  @override
  List<Object?> get props => [];
}

class TopSellersLoading extends TopSellersState {}

class TopSellersLoaded extends TopSellersState {
  final List<Product> products;
  const TopSellersLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class TopSellersError extends TopSellersState {
  final String message;
  const TopSellersError(this.message);

  @override
  List<Object?> get props => [message];
}
