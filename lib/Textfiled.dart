import 'package:flutter/material.dart';

class TextfiledExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Textfield examples")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone no',
                  hintText: 'Enter your phone no',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: .number,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'asset/images/logout.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Image.network(
                'https://picsum.photos/200',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("asset/images/logout.png"),
              ),
              ClipRect(
                // borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "asset/images/logout.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Stack(
                children: [
                  Image.asset("asset/images/logout.png", width: 50, height: 50),
                  Text('Hello Flutter'),
                ],
              ),
            ],
          ),
        ),

        // child: TextField(
        //   decoration: InputDecoration(
        //     labelText: 'Name',
        //     hintText: 'Enter your name',
        //     enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(15),
        //       borderSide: BorderSide(color: Colors.blue),
        //     ),
        //     focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(15),
        //       borderSide: BorderSide(color: Colors.amber, width: 2),
        //     ),
        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        //   ),
        // ),
      ),
    );
  }
}
