import 'package:counter_app/app_demo/riverpod/cart/cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CartRiverPodPage extends ConsumerStatefulWidget{

  const CartRiverPodPage({super.key});
  @override
  ConsumerState<CartRiverPodPage> createState() => _CartPage();

}

class _CartPage extends ConsumerState<CartRiverPodPage>{

  @override
  void initState(){
    super.initState();
    Future.microtask((){
      ref.read(cartProvider.notifier).fetchCart();
    });
  }

  @override
  Widget build(BuildContext context) {

    final cartState = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Cart',style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15
        ),),
      ),
      body: cartState.isLoading ?
      Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: cartState.products.length,
        itemBuilder: (context,index){
        final cartItem = cartState.products[index];
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: Row(
              children: [
                ClipRect(
                  child: Image.network(
                    cartItem.thumbnail,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${cartItem.id}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        cartItem.title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15
                        ),
                      ),
                      
                    ],
                  ) 
                )
              ],
            ),
          ),
        );
      })
    );
  }
}