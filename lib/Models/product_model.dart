import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;
  final DateTime createdAt;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
    required this.createdAt,
  });
  toJosn() {
    return {
      "productId": productId,
      "productTitle": productTitle,
      "productPrice": productPrice,
      "productCategory": productCategory,
      "productDescription": productDescription,
      "productImage": productImage,
      "productQuantity": productQuantity,
      "createdAt": createdAt.toIso8601String(),
    };
  }
  factory ProductModel.fromJson(json) {
    return ProductModel(
      productId: json["productId"] ?? "",
      productTitle: json["productTitle"] ?? "",
      productPrice: json["productPrice"] ?? "",
      productDescription: json["productDescription"] ?? "",
      productImage: json["productImage"] ?? "",
      productQuantity: json["productQuantity"] ?? "",
      createdAt: DateTime.now(),
      productCategory: json["productCategory"] ?? "",
    );
  }
}
