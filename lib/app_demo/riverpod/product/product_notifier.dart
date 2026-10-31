import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/model/product_model.dart';
import 'package:counter_app/api_service.dart';
import 'package:counter_app/app_demo/database/product_dao.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier() : super(ProductState());

  final _dao = ProductDao();
  static const int _limit = 10;

  Future<void> refreshData() async {
    // state = state.copyWith(isLoading: true);

    try {

      final page = await _fetchFromAPI(0);
      await _dao.clearProducts();

      await _dao.insertProductList(page.items);
      state = ProductState(
        products: page.items,
        isLoading: false,
        hasMore: page.hasMore
      );


      // final data = await ProductApiService.getRequest('/products');
      // final List products = data['products'];
      // final productList = products
      //     .map((json) => Product.fromJson(json))
      //     .toList();

      // await _dao.insertProductList(productList);
      // state = state.copyWith(products: productList, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchProduct() async {
    print('🚀 fetchProduct() called');
    state = state.copyWith(isLoading: true);
    await Future.delayed(Duration(seconds: 2));

    final page = await _loadPage(0);
    print(page.items.length);
    state = ProductState(
      products: page.items,
      isLoading: false,
      hasMore: page.hasMore,
    );

    // final cached = await _dao.getProducts();
    // if (cached.isNotEmpty) {
    //   state = state.copyWith(products: cached, isLoading: false);
    //   return;
    // }
    // await refreshData();
  }

  //Calls API: /products?limit=10&skip=20
  //Get one page of prodcts from server 

  Future<({List<Product> items, bool hasMore})> _fetchFromAPI(int skip) async{
      final data = await ProductApiService.getRequest(
        '/products?limit=$_limit&skip=$skip'
      );
      final List listProducts = data['products'];
      final int total = data['total'];
      final items = listProducts.map((json) => Product.fromJson(json)).toList();
      return (items: items,hasMore: skip + items.length < total);
  }

  //Loads One page: first trries database then API

  Future<({List<Product> items, bool hasMore})> _loadPage(int skip) async{

    final all = await _dao.getProducts();

    all.sort((a,b) => a.id.compareTo(b.id));

    final cached = all.skip(skip).take(_limit).toList();

  // 4. If the database has a full page (10 items), use it, no internet needed  
    if (cached.length == _limit){
      return (items: cached,hasMore: true);
    }

    try{
      final page = await _fetchFromAPI(skip);
      await _dao.insertProductList(page.items);
      return page;
    }catch (e){
      return(items:cached,hasMore:false);
    }
  }

  Future<void> loadMore() async{

    if (state.isLoading || state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true);
    final page = await _loadPage(state.products.length);
    state = state.copyWith(
      products: [...state.products,...page.items],
      isLoadingMore: false,
      hasMore: page.hasMore
    );

  }


  

}
