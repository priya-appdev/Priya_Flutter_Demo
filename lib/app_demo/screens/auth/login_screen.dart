import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../riverpod/user/user_provider.dart';
import '../../widgets/custom_text_fileds.dart';


class LoginpageState extends ConsumerStatefulWidget {
  const LoginpageState({super.key});

  @override
  ConsumerState<LoginpageState> createState() => _Loginpage();
}

class _Loginpage extends ConsumerState<LoginpageState> {
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isHiddenPassword = true;

  @override
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
                  CustomTextFileds(
                    controller: email, 
                    labelText: 'Email address', 
                    hintText: 'Enter your email address', 
                    prefixIcon: Icons.email
                  ),
                  SizedBox(height: 15),
                  CustomTextFileds(
                    controller: password, 
                    labelText: 'Password', 
                    hintText: 'Enter your password', 
                    prefixIcon: Icons.lock,
                    suffixIcon: isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                    obsecureText: isHiddenPassword,
                    onSuffixIconPressed: (){
                      setState(() {
                        isHiddenPassword = !isHiddenPassword;
                      });
                    },
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.push('/login/forgot-password');
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
                      onPressed: () async{
                        final error = _validateFields();
                        if (error != null){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error))
                          );
                        }else{
                          final isLoggedIn = await ref.read(userProvider.notifier).login(email: email.text, password: password.text);
                          // final isLoggedIn = await context.read<UserProvider>().login(
                          //   email.text , 
                          //   password.text
                          // );
                          if (!context.mounted) return;
                          if (isLoggedIn){
                            context.go('/home');
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Email or Password does not match'))
                            );
                          }

                          // if (email.text != provider.getEmail && password.text != provider.getPassword){
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Email or Password does not match')));
                          // }else{
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList()));
                          // }
                        }
                        // if (email.text.isEmpty) {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: Text('Invalid'),
                        //         content: Text('Please enter first name'),
                        //         actions: [
                        //           TextButton(
                        //             onPressed: () {
                        //               Navigator.pop(context);
                        //             },
                        //             child: Text('OK'),
                        //           ),
                        //         ],
                        //       );
                        //     },
                        //   );
                        // }else{
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList()));
                        // }
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
                          context.push('/login/register');
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

  String? _validateFields(){

    if (email.text.isEmpty)  return 'Please enter email address';

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text)){
      return 'Please enter valid email';
    }

    if (password.text.isEmpty) return 'Please enter password';

    if (password.text.length < 6) return 'Please enter atleast 6 char';
    return null;
    
  }

}
