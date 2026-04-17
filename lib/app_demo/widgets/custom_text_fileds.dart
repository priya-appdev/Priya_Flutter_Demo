import 'package:flutter/material.dart';

class CustomTextFileds extends StatelessWidget{

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obsecureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFileds({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
     this.obsecureText = false,
     this.keyboardType = TextInputType.text,
     this.validator,
  });

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      validator: validator,
      
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        prefixIcon: Icon(prefixIcon)
      ),
    );
  }
}