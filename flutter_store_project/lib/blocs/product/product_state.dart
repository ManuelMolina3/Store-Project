part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductFetchLoading extends ProductState {}

final class ProductFetchSucces extends ProductState {
  final ProductResponse productList;
  ProductFetchSucces(this.productList);
}

final class ProductFetchError extends ProductState {
  final String errorMesage;
  ProductFetchError(this.errorMesage);
}
