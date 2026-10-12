import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_text_fileds.dart';

class CreateNewPasswordState extends StatefulWidget {

  const CreateNewPasswordState({super.key});

  @override
  State<CreateNewPasswordState> createState() => _Createnewpassword();
}

class _Createnewpassword extends State<CreateNewPasswordState> {

   TextEditingController newPassword = TextEditingController();
   TextEditingController retypePassword = TextEditingController();

  bool isNewPassword = true;
  bool isRetypePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new password'),
        leading: IconButton(
          onPressed: () {
            context.pop();
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

                  CustomTextFileds(
                    controller: newPassword, 
                    labelText: 'New password', 
                    hintText: 'Enter your new password', 
                    prefixIcon: Icons.lock,
                    obsecureText: isNewPassword,
                    suffixIcon: isNewPassword ? Icons.visibility_off : Icons.visibility,
                    onSuffixIconPressed: () {
                      setState(() {
                        isNewPassword = !isNewPassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextFileds(
                    controller: retypePassword, 
                    labelText: 'Retype password', 
                    hintText: 'Enter your retype password', 
                    prefixIcon: Icons.lock,
                    obsecureText: isRetypePassword,
                    suffixIcon: isRetypePassword ? Icons.visibility_off : Icons.visibility,
                    onSuffixIconPressed: () {
                      setState(() {
                        isRetypePassword = !isRetypePassword;
                      });
                    },
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
                        // go() replaces the whole stack, like pushAndRemoveUntil.
                        context.go('/login');
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
