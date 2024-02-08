import 'dart:convert';

import 'package:flutter_store_project/models/user_response/user_response.dart';
import 'package:flutter_store_project/repositories/user/user_repository.dart';
import 'package:http/http.dart';

class UserRepositoryImpl extends UserRepository {
  final Client _httpClient = Client();

  @override
  Future<UserResponse> fetchUserDetails(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> fetchUsers() async {
    final response =
        await _httpClient.get(Uri.parse('https://fakestoreapi.com/carts/user'));
    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }
}
