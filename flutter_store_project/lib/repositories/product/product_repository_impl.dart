import 'dart:convert';

import 'package:flutter_store_project/models/product_response/product_response.dart';
import 'package:flutter_store_project/repositories/product/product_repository.dart';
import 'package:http/http.dart';

class ProductRepoImpl extends ProductRepo {
  final Client _httpClient = Client();

  @override
  Future<List<ProductResponse>> fetchProduct() async {
    final response =
        await _httpClient.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<ProductResponse> result =
          data.map((e) => ProductResponse.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Future<ProductResponse> fetchSingleProduct(int productId) async {
    final response = await _httpClient
        .get(Uri.parse('https://fakestoreapi.com/products/$productId'));
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }
}
