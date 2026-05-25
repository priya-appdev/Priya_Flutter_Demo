import 'package:flutter/material.dart';

class Textfiledform extends StatefulWidget {
  @override
  const Textfiledform({super.key});

  State<Textfiledform> createState() => _TextfiledFormPage();
}

class _TextfiledFormPage extends State<Textfiledform> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Registration page",
          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(
                  labelText: 'First name',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter first name',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter first name';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    if (firstName.text.isEmpty) {
                      showError('Please enter first name');
                      return;
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(String messgae) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(messgae),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
              ),
            ),
          ],
        );
      },
    );
  }
}
