
import 'dart:convert';

import 'package:counter_app/ProfilePage.dart';
import 'package:counter_app/api_service.dart';
import 'package:counter_app/model/provider.model.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/model/product_model.dart';
import 'package:provider/provider.dart';


class ProductList extends StatefulWidget{
 
  const ProductList({super.key});                       

  @override
  State<ProductList> createState() => _ProductListPage();
}

class _ProductListPage extends State<ProductList>{

   List<Product> productList = [];
   bool isLoading = true;
   
  @override
    void initState(){
    super.initState();
    _productGetList();
  }

  @override
  Widget build(BuildContext context){
    // final userProviderr = context.watch<UserProvider>();
    return Consumer<UserProvider>(builder: (context,userProvider,_){
       return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text('${userProvider.getFirstname} ${userProvider.getLastname}'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }, icon: Icon(Icons.person_pin_circle))
        ],
      ),
      body: isLoading ? 
        Center(child: CircularProgressIndicator(),) : 
        ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context,index){
          final product = productList[index];
          return Card(
            
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(product.thumbnail,height: 120,fit: BoxFit.cover),
                  ),
                // Image.network(product.thumbnail,height: 120,fit: BoxFit.cover),
                SizedBox(
                  height: 10,
                ),
                Text(product.title,style: TextStyle(fontFamily: 'Poppins',fontSize: 15,fontWeight: FontWeight.bold),), 
                SizedBox(
                  height: 5,
                ),
                Text(product.description,style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15
                ),
              ),
                SizedBox(
                  height: 10,
                ),
                Text('\$${product.price}',style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
                )
                ],
              ),
            ),
          );
        }
      ),
    );
    });
   
  }

  Future<void> _productList() async{
    try{
       final product = await ApiService.getProduct();
      setState(() {
       productList = product;
       isLoading = false;
    });
    }catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _productGetList() async{
    try{
        final data = await ProductApiService.getRequest('/products');
        final List products = data['products'];
        setState(() {
          productList = products.map((json) => Product.fromJson(json)).toList();
          isLoading = false;
        });
    }catch (e){
      setState(() {
        isLoading = false;
      });
      print('Error:$e');
    }
  }
}