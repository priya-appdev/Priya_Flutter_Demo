
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Cart{

    final int id;
    final List<CartProduct> products;

    Cart({
      required this.id,
      required this.products
    });

    factory Cart.fromJson(Map<String,dynamic> json){
     return Cart(
      id: json['id'], 
      products: List<CartProduct>.from(
        (json['products'] as List).map((p) => CartProduct.fromJson(p)),
      )); 
    }
}

class CartProduct{
  
  final int id;
  final String title;
  final double price;
  final int quantity;
  final String thumbnail;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail
  });

  factory CartProduct.fromJson(Map<String, dynamic> json){
    return CartProduct(
      id: json['id'], 
      title: json['title'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      thumbnail: json['thumbnail'] as String 
    );
  }
} 

// {
//       "id": 1,
//       "products": [
//         {
//           "id": 162,
//           "title": "Blue Frock",
//           "price": 29.99,
//           "quantity": 4,
//           "total": 119.96,
//           "discountPercentage": 12.13,
//           "discountedTotal": 105.41,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/tops/blue-frock/thumbnail.webp"
//         },
//         {
//           "id": 113,
//           "title": "Generic Motorcycle",
//           "price": 3999.99,
//           "quantity": 3,
//           "total": 11999.97,
//           "discountPercentage": 12.1,
//           "discountedTotal": 10547.97,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/motorcycle/generic-motorcycle/thumbnail.webp"
//         },
//         {
//           "id": 122,
//           "title": "iPhone 6",
//           "price": 299.99,
//           "quantity": 3,
//           "total": 899.97,
//           "discountPercentage": 6.69,
//           "discountedTotal": 839.76,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/smartphones/iphone-6/thumbnail.webp"
//         },
//         {
//           "id": 138,
//           "title": "Baseball Ball",
//           "price": 8.99,
//           "quantity": 2,
//           "total": 17.98,
//           "discountPercentage": 1.71,
//           "discountedTotal": 17.67,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/sports-accessories/baseball-ball/thumbnail.webp"
//         }
//       ],
//       "total": 13037.88,
//       "discountedTotal": 11510.81,
//       "userId": 1,
//       "totalProducts": 4,
//       "totalQuantity": 12
//     },