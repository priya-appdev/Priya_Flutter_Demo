import 'package:counter_app/model/provider.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget{

  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{

TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();

  @override
  
  Widget build(BuildContext context){
    
    final userProver = context.watch<UserProvider>();
    return Scaffold(
        appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10), 
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
           child: Column(
            children: [
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(
                  labelText:  userProver.getFirstname,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  // hintText: 'Enter first name',
                  // hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
                SizedBox(height: 15),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(
                  labelText: userProver.getLastname,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter last name',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ]
           )
        ),
      ),
    );
  }
}