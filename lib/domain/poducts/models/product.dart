import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Product extends Equatable {
  Product({
    this.id,
    required this.product_name,
    required this.product_price,
    this.product_start_date,
    this.product_end_date,
    this.productImg,
  });

  final String? id;
  final String product_name;
  final String product_price;
  final DateTime? product_start_date;
  final DateTime? product_end_date;
  final dynamic productImg;

  @override
  List<Object> get props => [
        // id,
        product_name,
        product_price,
        // product_start_date,
        // product_end_date
        productImg
      ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      // id: json['id'],
      product_name: json['product_name'],
      product_price: json['product_price'],
      product_start_date: DateTime.parse(json["product_start_date"]),
      product_end_date: DateTime.parse(json["product_end_date"]),
      productImg: json["product_img"] == null ? null : json["product_img"],
    );
  }

  @override
  String toString() =>
      'product { id: $id,product_name: $product_name, product_price: $product_price}';
}
