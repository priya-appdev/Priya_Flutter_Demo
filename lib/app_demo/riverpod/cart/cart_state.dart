
import 'package:counter_app/app_demo/model/cart_model.dart';

class CartState {

  final List<Cart> carts ;
  final bool isLoading;
  final String? error;

  CartState({
    this.carts = const[],
    this.isLoading = false,
    this.error
  });

  CartState copyWith({
    List<Cart>? carts ,
    bool? isLoading,
    String? error
   }){
    return CartState(
      carts: carts ?? this.carts,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error

    );
   }
}
