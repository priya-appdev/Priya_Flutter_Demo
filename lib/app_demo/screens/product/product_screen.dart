

import 'package:counter_app/ProfilePage.dart';
import 'package:counter_app/api_service.dart';
import 'package:counter_app/model/provider.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_app/app_demo/riverpod/product/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/riverpod/product/product_notifier.dart';


// class ProductList extends StatefulWidget{
 
//   const ProductList({super.key});                       

//   @override
//   State<ProductList> createState() => _ProductListPage();
// }

// class _ProductListPage extends State<ProductList>{

//   //  List<Product> productList = [];
//   //  bool isLoading = true;
   
//   @override
//     void initState(){
//     super.initState();
//     context.read<ProductProvider>().fetchProduct();
//     // _productGetList();
//   }

//   @override
//   Widget build(BuildContext context){
//     // final userProviderr = context.watch<UserProvider>();
//     return Consumer2<UserProvider,ProductProvider>(builder: 
//     (context,userProvider,ProductProvider,_){
//        return Scaffold(
//       appBar: AppBar(
        
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(Icons.arrow_back)),
//         title: Text('${userProvider.getFirstname} ${userProvider.getLastname}'),
//         actions: [
//           IconButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
//           }, icon: Icon(Icons.person_pin_circle))
//         ],
//       ),
//       body: ProductProvider.isLoading ? 
//         Center(child: CircularProgressIndicator(),) : 
//         ListView.builder(
//         itemCount: ProductProvider.products.length,
//         itemBuilder: (context,index){
//           final product = ProductProvider.products[index];
//           return Card(
            
//             margin: EdgeInsets.all(16),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Image.network(product.thumbnail,height: 120,fit: BoxFit.cover),
//                   ),
//                 // Image.network(product.thumbnail,height: 120,fit: BoxFit.cover),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(product.title,style: TextStyle(fontFamily: 'Poppins',fontSize: 15,fontWeight: FontWeight.bold),), 
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(product.description,style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 15
//                 ),
//               ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text('\$${product.price}',style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold
//                 ),
//                 )
//                 ],
//               ),
//             ),
//           );
//         }
//       ),
//     );
//     });
   
//   }

      // Future<void> _productGetList() async{
      //   try{
      //       final data = await ProductApiService.getRequest('/products');
      //       final List products = data['products'];
      //       setState(() {
      //         productList = products.map((json) => Product.fromJson(json)).toList();
      //         isLoading = false;
      //       });
      //   }catch (e){
      //     setState(() {
      //       isLoading = false;
      //     });
      //     print('Error:$e');
      //   }
      // }
// }


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
        automaticallyImplyLeading: false,
        centerTitle: true,
      
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
                  child: Padding(
                    padding: EdgeInsets.all(16),
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
                        '\$${product.price}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  )
                );
            })
    );

  }
}