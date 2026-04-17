
import 'package:counter_app/app_demo/riverpod/product/product_provider.dart';
import 'package:counter_app/model/provider.model.dart';
import 'package:flutter/material.dart';

import '../app_demo/riverpod/product/product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProductRiverpodPage extends ConsumerStatefulWidget{
  const ProductRiverpodPage({super.key});

  @override
  ConsumerState<ProductRiverpodPage> createState() => ProductPage();
}

class ProductPage extends ConsumerState<ProductRiverpodPage>{

  @override
  void initState(){
    super.initState();
    Future.microtask((){
      ref.read(productProvider.notifier).fetchProduct();
    });
  }

  @override
  Widget build(BuildContext context){

    final productState = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){

        // }, icon: Icon(Icons.arrow_back)),
        title: Text('Product list',style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15
        ),),
      ),
      body: productState.isLoading 
            ? Center(child: CircularProgressIndicator(),)
            : ListView.builder(
              itemCount: productState.products.length,
              itemBuilder: (context,index){
                final product = productState.products[index];
                return Card(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          product.thumbnail,height: 120,fit: BoxFit.cover
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${product.price}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                );
            })
    );

  }
}