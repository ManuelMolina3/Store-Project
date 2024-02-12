import 'package:flutter_store_project/models/product_response/product_response.dart';

abstract class ProductRepo {
  Future<List<ProductResponse>> fetchProduct();
  Future<ProductResponse> fetchSingleProduct(int productId);
}
