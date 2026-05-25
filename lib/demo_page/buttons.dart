import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Examples")),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print('Elevated button pressed');
              },
              child: Text("Tap button"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                print("Text button tap");
              },
              child: Text("Tap button"),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                print("Outline button tapped");
              },
              child: Text("Tap button"),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                print('Icon button tapped');
              },
              icon: Icon(Icons.star),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                print('Floating Action button Tap');
              },
              child: Text('Tap buuton'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                print('Button Pressed');
              },
              label: Text('Login'),
              icon: Icon(Icons.star),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
