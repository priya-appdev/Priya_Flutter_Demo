
import 'package:counter_app/app_demo/model/cart_model.dart';

class CartState {

  final List<CartProduct> products;
  final bool isLoading;

  CartState({
    this.products = const[],
    this.isLoading = true
  });

  CartState copyWith({
    List<CartProduct>? products ,
    bool? isLoading
   }){
    return CartState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading
    );
   }
}
