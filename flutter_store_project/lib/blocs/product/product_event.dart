part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductFetchList extends ProductEvent {}

class ProductViewDetails extends ProductEvent {
  final int productId;
  ProductViewDetails(this.productId);
}
