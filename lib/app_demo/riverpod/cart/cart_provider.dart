import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_notifire.dart';
import 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartNotifire,CartState>((ref){
  return CartNotifire();
});