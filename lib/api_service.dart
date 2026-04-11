import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:counter_app/model/product_model.dart';


class ApiService {

  static Future<List<Product>> getProduct() async{
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List products = data['products'];
      return products.map((json) => Product.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load users');
    }
  }
}


class ProductApiService{
  static const String baseUrl = "https://dummyjson.com";
  static String? token;

//COMMON HEADER

  static Map<String,String> _headers(){
    final header = {
      'Content-Type': 'application/json'
    };
    if (token != null){
      header['Authorization'] = 'token';
    }
    return header;
  }

//COMMON RESPONSE HANDLER

  static dynamic _handleResponse(http.Response response){
    if (response.statusCode >= 200 && response.statusCode < 300){
      return jsonDecode(response.body);
    }else if (response.statusCode == 401){
      throw Exception('Unauthorized');
    }else if (response.statusCode == 404){
      throw Exception('Not found');
    }else if (response.statusCode >= 500){
      throw Exception('Server error');
    }else{
      throw Exception('Error: ${response.statusCode}');
    }
  }

//GENERIC GET

  static Future<dynamic> getRequest(String endPoint) async{
    try{
      final response = await http.get(
        Uri.parse('$baseUrl$endPoint'),
        headers: _headers()
      );
      return _handleResponse(response);
    }catch (e){
      throw Exception('GET failed: ${e}');
    }
  }

//GENERIC POST

  static Future<dynamic> postRequest(String endPoint,Map<String,dynamic> body) async{
    try{
      final response = await http.post(
        Uri.parse('$baseUrl$endPoint'),
        headers: _headers(),
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    }catch (e){
      throw Exception('POST faile:${e}');
    }
  }

//GENERIC PUT

  static Future<dynamic> putRequest(String endPoint,Map<String,dynamic> body) async{
    try{
      final response = await http.put(
        Uri.parse('$baseUrl$endPoint'),
        headers: _headers(),
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    }catch (e){
      throw Exception('PUT failed:${e}');
    }
  }

//GENERIC DELETE

  static Future<dynamic> deleteRequest(String endPoint) async{
    try{
      final response = await http.delete(
        Uri.parse('$baseUrl$endPoint'),
        headers: _headers(),
      );
      return _handleResponse(response);
    }catch (e){
      throw Exception('DELETE failed:${e}');
    }
  }

}

