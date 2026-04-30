import 'package:counter_app/app_demo/database/appdatabase.dart';
import 'package:counter_app/app_demo/model/cart_model.dart';
import 'package:counter_app/app_demo/riverpod/cart/cart_provider.dart';
import 'package:counter_app/app_demo/riverpod/cart/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/api_service.dart';
import 'package:http/http.dart';

class CartNotifire extends StateNotifier<CartState>{
  CartNotifire(): super(CartState());

  final _dao  = CartDao();

  Future<void> fetchCart() async{
    state = state.copyWith(
      isLoading: true
    );

    final cached = await _dao.getCarts();
    if (cached.isNotEmpty){
      state = state.copyWith(
        carts: cached,
        isLoading: false
      );
    }

    try{

      final data = await ProductApiService.getRequest('/carts');
      final List carts = data['carts'];
      final response = CartListReponse.fromJson(data);
      await _dao.insertCartList(response.carts);
      // final allProducts = carts
      //     .expand((cart) => (cart['products'] as List ?? []))
      //     .map((product) => CartProduct.fromJson(product)).toList();
      state = state.copyWith(
        carts: response.carts,
        isLoading: false
      );

    }catch (e){
      state = state.copyWith(
        isLoading: false,
        error: e.toString()
      );
      print('Erro is ${e}');
    }
  }
}

final cartNotifire = StateNotifierProvider<CartNotifire,CartState>((ref){
  return CartNotifire();
});