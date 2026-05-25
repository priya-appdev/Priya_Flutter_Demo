import 'package:flutter/material.dart';

class DynamicListState extends StatefulWidget {
  @override
  const DynamicListState({super.key});

  State<DynamicListState> createState() => DynamicListStatePage();
}

class DynamicListStatePage extends State<DynamicListState> {
  final List<Product> productList = [
    Product(id: 1, price: 1900, title: 'iphone'),
    Product(id: 2, price: 1000, title: 'Samsung'),
    Product(id: 3, price: 1500, title: 'One plus'),
    Product(id: 4, price: 1200, title: 'Pixel'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product list')),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          // return InkWell(
          //   onTap: () {
          //     print(product.id);
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.all(15),
          //     child: Row(
          //       children: [
          //         Icon(Icons.phone),
          //         SizedBox(height: 20),
          //         Text(product.title),
          //       ],
          //     ),
          //   ),
          // );
          // return Container(
          //   margin: EdgeInsets.all(15),
          //   // padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
          //   ),
          //   child: ListTile(
          //     title: Text(product.title),
          //     subtitle: Text("\$${product.price}"),
          //   ),
          // );
          return Card(
            margin: EdgeInsets.all(15),
            child: ListTile(
              onTap: () {
                print(product.id);
              },
              leading: CircleAvatar(child: Text(product.id.toString())),
              title: Text(
                product.title,
                style: TextStyle(fontFamily: 'Poppins,'),
              ),
              subtitle: Text("\$${product.price}"),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final int id;
  final String title;
  final double price;

  Product({required this.id, required this.price, required this.title});
}
