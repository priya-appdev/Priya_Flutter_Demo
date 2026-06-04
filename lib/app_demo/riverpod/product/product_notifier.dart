import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/model/product_model.dart';
import 'package:counter_app/api_service.dart';
import 'package:counter_app/app_demo/database/product_dao.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState());

  final _dao = ProductDao();

  Future<void> refreshData() async {
    // state = state.copyWith(isLoading: true);

    try {
      final data = await ProductApiService.getRequest('/products');
      final List products = data['products'];
      final productList = products
          .map((json) => Product.fromJson(json))
          .toList();

      await _dao.insertProductList(productList);
      state = state.copyWith(products: productList, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchProduct() async {
    print('🚀 fetchProduct() called');
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));
    final cached = await _dao.getProducts();
    if (cached.isNotEmpty) {
      state = state.copyWith(products: cached, isLoading: false);
      return;
    }
    await refreshData();
  }
}
