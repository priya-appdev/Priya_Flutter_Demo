import 'package:flutter/material.dart';

class ScrollTextfiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrollable Textfile')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Enter description'),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Message',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Please enter message',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
