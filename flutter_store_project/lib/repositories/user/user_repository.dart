import 'package:flutter_store_project/models/user_response/user_response.dart';

abstract class UserRepository {
  Future<UserResponse> fetchUsers();
  Future<UserResponse> fetchUserDetails(int userId);
}
