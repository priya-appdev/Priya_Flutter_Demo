import 'package:counter_app/app_demo/database/appdatabase.dart';
import 'package:counter_app/app_demo/model/cart_model.dart';
import 'package:counter_app/app_demo/riverpod/cart/cart_provider.dart';
import 'package:counter_app/app_demo/riverpod/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/api_service.dart';
import 'package:http/http.dart';

class CartNotifire extends StateNotifier<CartState> {
  CartNotifire() : super(CartState());

  final _dao = CartDao();

  Future<void> fetchCart() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));
    final cached = await _dao.getCarts();
    if (cached.isNotEmpty) {
      //DB has data then shows it
      state = state.copyWith(carts: cached, isLoading: false);
      return;
    }
    await refreshData();
  }

  Future<void> refreshData() async {
    //state = state.copyWith(isLoading: true);
    try {
      final data = await ProductApiService.getRequest('/carts');
      final response = CartListReponse.fromJson(data);
      await _dao.insertCartList(response.carts);
      state = state.copyWith(isLoading: false, carts: response.carts);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final cartNotifire = StateNotifierProvider<CartNotifire, CartState>((ref) {
  return CartNotifire();
});
