import 'package:flutter/material.dart';

class ExpandedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded List')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(height: 100, color: Colors.blue),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 3,
              child: Container(height: 100, color: Colors.amber),
            ),
            SizedBox(width: 20),
            Expanded(flex: 1, child: Container(height: 100, color: Colors.red)),
            TextButton(
              onPressed: () {
                print('Button is tapped');
              },
              child: Text("Tap on button"),
            ),
          ],
        ),
      ),
      // body: Row(
      //   children: [
      //     Expanded(child: Container(height: 100, color: Colors.red)),
      //     Expanded(child: Container(height: 100, color: Colors.amber)),
      //     Expanded(child: Container(height: 100, color: Colors.blue)),
      //   ],
      // ),
    );
  }
}
