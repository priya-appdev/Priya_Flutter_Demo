
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/model/product_model.dart';
import 'package:counter_app/api_service.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState>{
  ProductNotifier() : super(ProductState());

  Future<void> fetchProduct() async{
    state = state.copyWith(
      isLoading: true
    );
    try{
      final data = await ProductApiService.getRequest('/products');
      final List products = data['products'];
      final productList = products.map((json) => Product.fromJson(json)).toList();

      state = state.copyWith(
        products: productList,
        isLoading: false
      );

    }catch (e){
      state = state.copyWith(isLoading: false);
      print('Error is $e');
    }
  }
}

final productProvider = StateNotifierProvider<ProductNotifier,ProductState>((ref) {
  return ProductNotifier();
});