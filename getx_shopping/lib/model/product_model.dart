import 'package:flutter/material.dart';
import 'package:getx_shopping/helper/extension.dart';

class ProductModel {
  late String name;
  late String image;
  late String description;
  late Color color;
  late String sized;
  late String price;
  late String productId;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.sized,
    required this.price,
    required this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
