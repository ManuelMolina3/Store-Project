import 'dart:convert';

import 'address.dart';
import 'name.dart';

class UserResponse {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? v;

  UserResponse({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  });

  factory UserResponse.fromMap(Map<String, dynamic> data) => UserResponse(
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        id: data['id'] as int?,
        email: data['email'] as String?,
        username: data['username'] as String?,
        password: data['password'] as String?,
        name: data['name'] == null
            ? null
            : Name.fromMap(data['name'] as Map<String, dynamic>),
        phone: data['phone'] as String?,
        v: data['__v'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'address': address?.toMap(),
        'id': id,
        'email': email,
        'username': username,
        'password': password,
        'name': name?.toMap(),
        'phone': phone,
        '__v': v,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserResponse].
  factory UserResponse.fromJson(String data) {
    return UserResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
