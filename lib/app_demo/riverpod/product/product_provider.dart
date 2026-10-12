import 'package:counter_app/app_demo/riverpod/product/product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_state.dart';

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>((
  ref,
) {
  return ProductNotifier();
});
