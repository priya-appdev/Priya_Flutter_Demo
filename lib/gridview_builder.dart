import 'package:flutter/material.dart';

class GridviewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gridview Example')),
      body: GridView.extent(
        maxCrossAxisExtent: 200,
        children: [Text('Item 1'), Text('Item 2'), Text('Item 3')],
      ),
      // body: GridView.builder(
      //   scrollDirection: Axis.vertical,
      //   padding: EdgeInsets.all(20),
      //   itemCount: 50,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 20,
      //     mainAxisSpacing: 20,
      //     // childAspectRatio: 1,
      //   ),
      //   itemBuilder: (context, index) {
      //     return Card(child: Center(child: Text('Item $index')));
      //   },
      // ),
    );
  }
}
