import 'package:counter_app/app_demo/model/product_model.dart';
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
        itemCount: cartState.carts.length,
        itemBuilder: (context,index){
        final cartItem = cartState.carts[index];
        return CartSection(cart: cartItem);
      })
    );
  }
}

class CartSection extends StatelessWidget{
  final cart;

  const CartSection({required this.cart});

  @override
  Widget build(BuildContext context){

    return Padding(
      padding: EdgeInsets.all(22),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRect(
          
          // color: Colors.grey[200],
          // padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text('Cart ID: ${cart.id}',
              style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
              ),
              Text('Total: \$${cart.total.toStringAsFixed(2)}',
              style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
              ),
              Text('Discounted: \$${cart.discountedTotal.toStringAsFixed(2)}',
              style: TextStyle(fontFamily: 'Poppins',fontSize: 15),
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cart.products.length,
          itemBuilder: (context,index){
            final product = cart.products[index];
            return ProductSection(product: product);
          }
        )
      ],
    )
    );
  }
}

class ProductSection extends StatelessWidget{

  final product;

  const ProductSection({required this.product});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
              children: [
                ClipRect(
                  child: Image.network(
                    product.thumbnail,
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
                        'ID: ${product.id}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        product.title,
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
  }
}