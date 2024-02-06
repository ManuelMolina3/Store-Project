import 'dart:convert';

import 'rating.dart';

class ProductResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductResponse.fromMap(Map<String, dynamic> data) {
    return ProductResponse(
      id: data['id'] as int?,
      title: data['title'] as String?,
      price: (data['price'] as num?)?.toDouble(),
      description: data['description'] as String?,
      category: data['category'] as String?,
      image: data['image'] as String?,
      rating: data['rating'] == null
          ? null
          : Rating.fromMap(data['rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductResponse].
  factory ProductResponse.fromJson(String data) {
    return ProductResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
