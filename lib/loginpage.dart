import 'package:counter_app/RegistrationPage.dart';
import 'package:counter_app/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/textFiledForm.dart';

class LoginpageState extends StatefulWidget {
  const LoginpageState({super.key});

  @override
  State<LoginpageState> createState() => _Loginpage();
}

class _Loginpage extends State<LoginpageState> {
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHiddenPassword = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/logout.png',
              height: 80,
              width: 80,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'Tally Connector',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Welcome back! Login to continue',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      hintText: 'Email address',
                      hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: password,
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHiddenPassword = !isHiddenPassword;
                          });
                        },
                        icon: Icon(
                          isHiddenPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Forgot password?',

                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,

                    // color: Colors.white,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        if (email.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Invalid'),
                                content: Text('Please enter first name'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        elevation: 0,
                        backgroundColor: Colors.white,
                        overlayColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationDemopage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
