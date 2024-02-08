import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_store_project/models/product_response/product_response.dart';
import 'package:flutter_store_project/repositories/product/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;

  ProductBloc(this._productRepo) : super(ProductInitial()) {
    on<ProductEvent>(_onProductFetchList);
  }

  Future<FutureOr<void>> _onProductFetchList(
      ProductFetchList event, Emitter<ProductState> emit) async {
    try {
      final productList = await _productRepo.fetchProduct();
      emit(ProductFetchSucces(productList));
    } catch (e) {
      emit(ProductFetchError(e.toString()));
    }
  }
}
