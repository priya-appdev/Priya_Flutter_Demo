import 'package:counter_app/app_demo/model/product_model.dart';

class ProductState{

  final List<Product> products;
  final bool isLoading;

  ProductState ({
    this.products = const[],
    this.isLoading = true,
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
  }){
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading
    );
  }
}