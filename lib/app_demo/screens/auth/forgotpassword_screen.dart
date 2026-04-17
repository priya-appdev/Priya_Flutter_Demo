import 'package:counter_app/app_demo/screens/auth/createnewpassword_screen.dart';
import 'package:flutter/material.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordPage();
}

class _ForgotpasswordPage extends State<ForgotpasswordScreen> {
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
        title: Text(
          'Forgot Password',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/logout.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    'Forgot password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Enter your email to receive a password reset link'),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                        hintText: 'Email address',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 50,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewPasswordState(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Send reset link',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back to login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
