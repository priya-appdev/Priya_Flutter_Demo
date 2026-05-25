import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Example", style: TextStyle(fontSize: 30)),
      ),
      body: Center(
        child: Container(
          width: 200,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.green, blurRadius: 5)],
          ),
          // width: 200,
          // height: 200,
          // alignment: .center,
          padding: EdgeInsets.all(20),
          // color: Colors.amber,
          child: Text(
            "This is a very long text that will not fit in a small container.",
            style: TextStyle(fontSize: 20),
            // maxLines: 1,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
      // body: Container(
      //   width: 200,
      //   height: 200,
      //   padding: EdgeInsets.all(10),
      //   alignment: .center,
      //   color: Colors.amber,
      //   child: Text(
      //     "Hello Flutter",
      //     style: TextStyle(fontSize: 20, color: Colors.blue),
      //   ),
      // ),
    );
  }
}
