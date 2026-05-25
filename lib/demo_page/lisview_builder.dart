import 'package:flutter/material.dart';

class ListviewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview builder')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text('User ${index}'),
            subtitle: Text('Flutter Developer'),
          );
        },
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  final String title;
  final String amount;
  final Map<String, dynamic> data;
  final Function(String) onDataSelected;

  @override
  const ProductList({
    super.key,
    required this.title,
    required this.amount,
    required this.data,
    required this.onDataSelected,
  });

  State<ProductList> createState() => _ProductListPage();
}

class _ProductListPage extends State<ProductList> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'iPhone 15',
      'price': '799',
      'category': 'Mobile',
      'icon': Icons.phone_iphone,
    },
    {
      'name': 'MacBook Pro',
      'price': '1999',
      'category': 'Laptop',
      'icon': Icons.laptop_mac,
    },
    {
      'name': 'AirPods Pro',
      'price': '249',
      'category': 'Audio',
      'icon': Icons.headphones,
    },
    {
      'name': 'iPad Air',
      'price': '599',
      'category': 'Tablet',
      'icon': Icons.tablet_mac,
    },
    {
      'name': 'Apple Watch',
      'price': '399',
      'category': 'Watch',
      'icon': Icons.watch,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
        ),
        leading: IconButton(
          onPressed: () {
            widget.onDataSelected('Seleced item');
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          print(widget.data);
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              leading: Icon(product['icon']),
              title: Text(
                product['name'],
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
              ),
              trailing: Text('\$${product['price']}'),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
