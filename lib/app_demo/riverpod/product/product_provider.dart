
import 'package:counter_app/app_demo/riverpod/product/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/product_model.dart';
import 'product_state.dart';

class ProductProvider  extends ChangeNotifier{

  List<Product> _product = [];
  bool _isLoading = true;

  List<Product> get products => _product;
  bool get isLoading => _isLoading;

  Future<void> fetchProduct() async{
    _isLoading = true;
    try{
      final data = await ProductApiService.getRequest('/products');
      final List products = data['products'];
      _product = products.map((json) => Product.fromJson(json)).toList();
      _isLoading = false;
      notifyListeners();
    }catch (e){
      _isLoading = false;
      notifyListeners();
      print('Error ${e}');
    }
  }

  final productProvider = StateNotifierProvider<ProductNotifier,ProductState>((ref){
      return ProductNotifier();
  });
}