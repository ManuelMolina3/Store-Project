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
  Future<List<UserResponse>> fetchUsers() async {
    final response =
        await _httpClient.get(Uri.parse('https://fakestoreapi.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<UserResponse> results =
          data.map((x) => UserResponse.fromJson(x)).toList();
      return results;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
