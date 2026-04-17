import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier{

  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _phone = "";
  String _password = "";
  String _retypepassword = "";
  String _city = "";
  String _state = "";
  String _country = "";
  String _streetAddress = "";
  String _message = "";

  String get getFirstname => _firstName;
  String get getLastname => _lastName;
  String get getPhoneno => _phone;
  String get getPassword => _password;
  String get getRetypePassword => _retypepassword;
  String get getCity => _city;
  String get getState => _state;
  String get getCountry => _country;
  String get getStreetAddress => _streetAddress;
  String get getMessage => _message;
  String get getEmail => _email;


  Future<bool> login(String email, String password) async{
    if (_email == email && _password == password){
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register({
    required String firstname,
    required String lastname,
    required String emailID,
    required String phonnumber,
    required String password,
    required String retypepassword,
    required String country,
    required String state,
    required String city,
    required String streetAddress,
    required String message
  }) async{
    await setUser(firstname, lastname, emailID, phonnumber, password, retypepassword, city, state, country, streetAddress, message);
    return true;
  }

  Future<void> loadUser() async{

    final pref = await SharedPreferences.getInstance();
    _firstName = pref.getString('firstName') ?? "";
    _lastName = pref.getString('lastName') ?? "";
    _email = pref.getString('email') ?? "";
    _phone = pref.getString('phoneno') ?? "";
    _password = pref.getString('password') ?? "";
    _retypepassword = pref.getString('retypepassword') ?? "";
    _country = pref.getString('country') ?? "";
    _state = pref.getString('state') ?? "";
    _city = pref.getString('city') ?? "";
    _streetAddress = pref.getString('streetAddress') ?? "";
    _message = pref.getString('message') ?? "";

  }

  Future<void> setUser(
    String first,
    String last,
    String emailAddress,
    String phoneno,
    String password,
    String retypepassword , 
    String city,
    String state,
    String country, 
    String Street, 
    String msg) async{
          _firstName = first;
          _lastName = last;
          _email = emailAddress;
          _phone = phoneno;
          _password = password;
          _retypepassword = retypepassword;
          _city = city;
          _state = state;
          _country = country;
          _streetAddress = Street;
          _message = msg;

            final pref = await SharedPreferences.getInstance();
            await pref.setString('firstName',first,);
            await pref.setString('lastName',last);
            await pref.setString('email',emailAddress);
            await pref.setString('phoneno',phoneno,);
            await pref.setString('password',password,);
            await pref.setString('retypepassword',retypepassword);
            await pref.setString('country',country);
            await pref.setString('state',state);
            await pref.setString('city',city);
            await pref.setString('streetAddress',Street);
            await pref.setString('message',msg);

            notifyListeners();
  }
}