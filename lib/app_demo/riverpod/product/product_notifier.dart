import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/model/product_model.dart';
import 'package:counter_app/api_service.dart';
import 'package:counter_app/app_demo/database/product_databse.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState());

  Future<void> fetchProduct() async {
    print('🚀 fetchProduct() called');
    state = state.copyWith(isLoading: true);

    // 1. Load cached data from SQLite first
    try {
      final cached = await ProductDatabse.instance.getProducts();
      print('📦 Cached products in DB: ${cached.length}');
      if (cached.isNotEmpty) {
        state = state.copyWith(products: cached, isLoading: false);
        print('✅ Loaded ${cached.length} products from DB');
        print('First cached product: ${cached.first.title}');
      }
    } catch (e, stack) {
      print('❌ DB read failed: $e');
      print('Stack: $stack');
    }

    // 2. Fetch fresh data from API
    try {
      final data = await ProductApiService.getRequest('/products');
      final List products = data['products'];
      final productList =
          products.map((json) => Product.fromJson(json)).toList();

      // 3. Save fresh data to SQLite
      try {
        await ProductDatabse.instance.clearProdcut();
        await ProductDatabse.instance.insertProductList(productList);

        final saved = await ProductDatabse.instance.getProducts();
        print('✅ DB has ${saved.length} products after save');
        if (saved.isNotEmpty) {
          print('First product: ${saved.first.title}');
        }
      } catch (e, stack) {
        print('❌ DB write failed: $e');
        print('Stack: $stack');
      }

      state = state.copyWith(products: productList, isLoading: false);
    } catch (e, stack) {
      print('❌ API failed: $e');
      print('Stack: $stack');
      state = state.copyWith(isLoading: false);
    }
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  return ProductNotifier();
});
