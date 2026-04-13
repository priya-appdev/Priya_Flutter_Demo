import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String firstName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String password = "";
  String retypepassword = "";
  String city = "";
  String state = "";
  String country = "";
  String streetAddress = "";
  String message = "";

  String get getFirstname => firstName;
  String get getLastname => lastName;
  String get getPhoneno => phone;
  String get getPassword => password;
  String get getRetypePassword => retypepassword;
  String get getCity => city;
  


  void setUser(String first,String last,String emailAddress,
  String phoneno,String password,String retypepassword , 
  String city,String state,String country, String Street, String msg){
    firstName = first;
    lastName = last;
    email = emailAddress;
    phone = phoneno;
    password = password;
    retypepassword = retypepassword;
    city = city;
    state = state;
    country = country;
    streetAddress = Street;
    message = msg;
    notifyListeners();
  }
}