import 'package:flutter/material.dart';
import 'package:counter_app/app_demo/screens/auth/login_screen.dart';

class CreateNewPasswordState extends StatefulWidget {
  @override
  const CreateNewPasswordState({super.key});
  State<CreateNewPasswordState> createState() => Createnewpassword();
}

class Createnewpassword extends State<CreateNewPasswordState> {
  bool isNewPassword = true;
  bool isRetypePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new password'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/logout.png',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'Create new password',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Please enter a new password',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  TextField(
                    obscureText: isNewPassword,
                    decoration: InputDecoration(
                      labelText: 'New password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      hintText: 'Enter your new password',
                      hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isNewPassword = !isNewPassword;
                          });
                        },
                        icon: Icon(
                          isNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  TextField(
                    obscureText: isRetypePassword,
                    decoration: InputDecoration(
                      labelText: 'Retype password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      hintText: 'Enter your retype password',
                      hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isRetypePassword = !isRetypePassword;
                          });
                        },
                        icon: Icon(
                          isRetypePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    height: 50,

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 3),
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    LoginpageState(),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(
                                        -1.0,
                                        0.0,
                                      ), // slides from left to right
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                          ),
                          (route) => false,
                        );
                      },

                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: .none,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.purple,
                        ),
                      ),
                    ),
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
