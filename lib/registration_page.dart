import 'package:counter_app/example.dart';
import 'package:flutter/material.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<Registrationpage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypepassword = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController streetaddress = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController businessid = TextEditingController();
  TextEditingController gstnumber = TextEditingController();

  bool isHidden = true;
  bool isHiddenRetypePassword = true;

  @override
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              TextField(
                controller: firstname,
                style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'First name',
                  labelStyle: TextStyle(fontFamily: "Poppins", fontSize: 15),
                  hintText: 'Enter your first name',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: lastname,
                style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Last name",
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: "Enter your last name",
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: email,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                obscureText: isHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    icon: Icon(
                      isHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: retypepassword,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                obscureText: isHiddenRetypePassword,
                decoration: InputDecoration(
                  labelText: 'Retype password',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter your retype password',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isHiddenRetypePassword = !isHiddenRetypePassword;
                      });
                    },
                    icon: Icon(
                      isHiddenRetypePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: phoneno,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Phone no',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter your phone no',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: streetaddress,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Street address',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: "Enter your street address",
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.pin),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: pincode,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: "Enter your pincode number",
                  prefixIcon: Icon(Icons.pin),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: country,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Enter your country name',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: state,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Please enter your state name',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.pin),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: businessid,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Business id',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Please enter business id',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: gstnumber,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Gst number',
                  labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  hintText: 'Please enter your gst number',
                  hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  prefixIcon: Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ExamplePageState(),
                    //   ),
                    // );

                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        final topPadding = MediaQuery.of(context).padding.top;
                        return Padding(
                          padding: EdgeInsets.only(top: topPadding),
                          child: Container(
                            width: double.infinity,
                            // height: MediaQuery.of(context).size.height,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Registration sucessful',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
