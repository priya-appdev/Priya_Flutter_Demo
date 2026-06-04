import 'package:counter_app/app_demo/riverpod/product/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/product_model.dart';
import 'product_state.dart';

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>((
  ref,
) {
  return ProductNotifier();
});
