import 'package:counter_app/app_demo/model/product_model.dart';

class ProductState{

  final List<Product> products;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;


  ProductState ({
    this.products = const[],
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasMore = true
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore
  }){
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore
    );
  }
}