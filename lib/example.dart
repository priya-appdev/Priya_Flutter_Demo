import 'package:flutter/material.dart';

class ExamplePageState extends StatelessWidget {
  const ExamplePageState({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example page')),

      body: Row(
        children: [
          Icon(Icons.star),
          Text("Hello there"),
          ElevatedButton(onPressed: () {}, child: Text("Vote")),
        ],
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Hello", style: TextStyle(fontSize: 30)),
      //       SizedBox(height: 30),
      //       Icon(Icons.star, size: 30),
      //       SizedBox(height: 30),
      //       ElevatedButton(onPressed: () {}, child: Text("Sign in")),
      //     ],
      //   ),
      // ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text('Hello', style: TextStyle(fontSize: 30)),
      //     SizedBox(height: 20),
      //     Icon(Icons.star, size: 40),
      //     SizedBox(height: 20),
      //     ElevatedButton(onPressed: () {}, child: Text('Click me')),
      //   ],
      // ),
    );
  }
}
