
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:counter_app/app_demo/riverpod/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState>{
  UserNotifier() : super(UserState());


  Future<void> loadUser() async{
    final pref = await SharedPreferences.getInstance();
    state = state.copyWith(
      firstName: pref.getString('firstName') ?? "",
      lastName: pref.getString('lastName') ?? "",
      email: pref.getString('email') ?? "",
      phone:pref.getString('phoneno') ?? "",
      password:pref.getString('password') ?? "",
      retypepassword: pref.getString('retypepassword') ?? "",
      city:pref.getString('city') ?? "",
      state:pref.getString('state') ?? "",
      country:pref.getString('country') ?? "",
      streetaddress:pref.getString('streetaddress') ?? "",
      message: pref.getString('message') ?? ""
    );
  }

  Future<void> setUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String retypepassword,
    required String country,
    required String stateprovience,
    required String city,
    required String streetAddress,
    required String message
  }) async{
    final pref = await SharedPreferences.getInstance();
    print('Saving Email: $email');
    print('Saving Password: $password');
    await pref.setString('firstName',firstName,);
            await pref.setString('lastName',lastName);
            await pref.setString('email',email);
            await pref.setString('phoneno',phone,);
            await pref.setString('password',password,);
            await pref.setString('retypepassword',retypepassword);
            await pref.setString('country',country);
            await pref.setString('state',stateprovience);
            await pref.setString('city',city);
            await pref.setString('streetaddress',streetAddress);
            await pref.setString('message',message);

    state = state.copyWith(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      retypepassword: retypepassword,
      city: city,
      state: stateprovience,
      country: country,
      streetaddress: streetAddress,
      message: message
    );
  }

  void updateName(String name){
    state = state.copyWith(firstName: name);
  }

  void updateLastName(String lastname){
    state = state.copyWith(lastName: lastname);
  }

  Future<bool> login({
    required String email,
    required String password
  }) async {
      final pref = await SharedPreferences.getInstance();

      final savedEmail = pref.getString('email') ?? "";
      final savedPassword = pref.getString('password') ?? "";
      final phoneno = pref.getString('phoneno') ?? "";

      print('Enterd email ${email}');
      print('Enterd password ${password}');
       print('Saved Email: "$savedEmail"');
      print('Saved Password: "$savedPassword"');
      print('Saved Password: "$phoneno"');

      if (email == savedEmail && password == savedPassword){
        await loadUser();
        return true;
      }
      return false;
  }
}

