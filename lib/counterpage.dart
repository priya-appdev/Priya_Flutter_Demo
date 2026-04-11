import 'package:flutter/material.dart';

class CounterPageState extends StatefulWidget {
  @override
  Counterpage createState() => Counterpage();
}

class Counterpage extends State<CounterPageState> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(child: Text("$count", style: TextStyle(fontSize: 30))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: decrement, child: Icon(Icons.remove)),
          SizedBox(height: 20),
          FloatingActionButton(onPressed: increment, child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
