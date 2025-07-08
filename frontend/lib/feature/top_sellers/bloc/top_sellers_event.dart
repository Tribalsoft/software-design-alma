import 'package:equatable/equatable.dart';

abstract class TopSellersEvent extends Equatable {
  const TopSellersEvent();

  @override
  List<Object?> get props => [];
}

class FetchTopSellers extends TopSellersEvent {}
