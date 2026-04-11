import 'package:flutter/material.dart';

class Texteditorcontroller extends StatefulWidget {
  
  const Texteditorcontroller({super.key});

  @override
  State<Texteditorcontroller> createState() => _TextFiledExampleState();

}

class _TextFiledExampleState extends State<Texteditorcontroller> {
  TextEditingController name = TextEditingController();
  String firstname = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextEditor controller example")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // firstname = name.text;
                });
              },
              child: Text('Submit'),
            ),
            Text('Your name is ${name.text}'),
          ],
        ),
      ),
    );
  }
}
