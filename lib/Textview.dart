import 'package:flutter/material.dart';

class TextviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Message')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Message'),
            SizedBox(height: 20),
            TextField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter your message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
