import 'package:flutter/material.dart';

class ProductModel {
  String name;
  String image;
  String description;
  String sized;
  String price;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.sized,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      sized: json['sized'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'sized': sized,
      'price': price,
    };
  }
}
