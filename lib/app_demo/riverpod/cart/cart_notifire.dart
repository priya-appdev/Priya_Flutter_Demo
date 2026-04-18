import 'package:counter_app/app_demo/model/cart_model.dart';
import 'package:counter_app/app_demo/riverpod/cart/cart_provider.dart';
import 'package:counter_app/app_demo/riverpod/cart/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/api_service.dart';

class CartNotifire extends StateNotifier<CartState>{
  CartNotifire(): super(CartState());

  Future<void> fetchCart() async{
    state = state.copyWith(
      isLoading: true
    );
    try{
      final data = await ProductApiService.getRequest('/carts');
      final List carts = data['carts'];
      final allProducts = carts
          .expand((cart) => (cart['products'] as List ?? []))
          .map((product) => CartProduct.fromJson(product)).toList();
      state = state.copyWith(
        products: allProducts,
        isLoading: false
      );

    }catch (e){
      state = state.copyWith(
        isLoading: false
      );
      print('Erro is ${e}');
    }
  }
}

final cartNotifire = StateNotifierProvider<CartNotifire,CartState>((ref){
  return CartNotifire();
});