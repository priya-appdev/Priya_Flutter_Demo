

import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_fileds.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/user/user_provider.dart';

class ProfileScreenState extends ConsumerStatefulWidget{

  const ProfileScreenState({super.key});

  @override
  ConsumerState<ProfileScreenState> createState() => _ProfileScreen();

}

class _ProfileScreen extends ConsumerState<ProfileScreenState>{

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypePassword = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController streetaddress = TextEditingController();
  TextEditingController phoneno = TextEditingController();

  bool showPassword = false;
  bool isOldPassword = false;
  bool isNewpassword = false;
  bool isRetypePassword = false;
  String? selectedCity;

  final List<String> cities = [
    'Ahmedabad',
    'Vadodara',
    'Delhi',
    'Mumbai',
    'Pune',
    'Jaipur',
  ];

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final user = ref.read(userProvider);
      firstName.text = user.firstName;
      lastName.text = user.lastName;
      email.text = user.email;
      phoneno.text = user.phone;
      country.text = user.country;
      state.text = user.state;
      streetaddress.text = user.streetaddress;
      setState(() {
        selectedCity = cities.contains(user.city) ? user.city : null;
        print(selectedCity);
      });
    });
  }

  @override
  void dispose(){
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    oldPassword.dispose();
    newPassword.dispose();
    retypePassword.dispose();
    country.dispose();
    state.dispose();
    city.dispose();
    streetaddress.dispose();
    phoneno.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile',
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins'
        ),
      ),
      
      actions: [
        IconButton(onPressed: (){
            showDialog(
              context: context, 
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Alert',
                  style: TextStyle(fontFamily: 'Poppins',fontSize: 15),),
                  content: Text('Are you sure you want to logout?',
                  style: TextStyle(fontFamily: 'Poppins',fontSize: 15)),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('Cancel',style: TextStyle(fontFamily: 'Poppins',fontSize: 15),)),
                    TextButton(onPressed: () async{
                      Navigator.of(context).pop();
                      await ref.read(userProvider.notifier).logout();
                      if (!context.mounted) return;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const AuthGate()), (route) => false);
                    }, child: Text('OK',style: TextStyle(fontFamily: 'Poppins',fontSize: 15),))
                  ],
                );
              });
        }, icon: Icon(Icons.exit_to_app))
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFileds(
              controller: firstName, 
              labelText: "First name", 
              hintText: "Enter your first name", 
              prefixIcon: Icons.person),
            SizedBox(
                height: 15,
            ),
            CustomTextFileds(
              controller: lastName, 
              labelText: "Last name", 
              hintText: "Enter your last name", prefixIcon: Icons.person),
            SizedBox(
              height: 15
            ),
            CustomTextFileds(
              controller: email, 
              labelText: "Email address", 
              hintText: "Enter your email address", 
              prefixIcon: Icons.email),
            SizedBox(
              height: 15,
            ),
            CustomTextFileds(
              controller: phoneno, 
              labelText: "Phone no", 
              hintText: "Enter your phone no" ,
              prefixIcon: Icons.phone),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: showPassword ? Icon(Icons.check,size: 18,color: Colors.black,) : null
                  ),
                ),
                SizedBox(width: 10),
                Text('Show password',style: TextStyle(fontFamily: 'Poppins',fontSize: 15),),
              ],
            ),
            if (showPassword) ...[
              SizedBox(
                height: 15,
              ),
              CustomTextFileds(
                controller: oldPassword, 
                labelText: "Old password", 
                hintText: "Enter old password", 
                prefixIcon: Icons.lock,
                obsecureText: isOldPassword,
                suffixIcon: isOldPassword ? Icons.visibility : Icons.visibility_off,
                onSuffixIconPressed: (){
                  setState(() {
                    isOldPassword = !isOldPassword;
                  });
                },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFileds(
                  controller: newPassword, 
                  labelText: "New password", 
                  hintText: "Enter new password", 
                  obsecureText: isNewpassword,
                  prefixIcon: Icons.lock,
                  suffixIcon: isNewpassword ? Icons.visibility : Icons.visibility_off,
                  onSuffixIconPressed: (){
                    setState(() {
                      isNewpassword = !isNewpassword;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFileds(
                  controller: retypePassword, 
                  labelText: "Retype password", 
                  hintText: "Enter new retype password", 
                  prefixIcon: Icons.lock,
                  obsecureText: isRetypePassword,
                  suffixIcon: isRetypePassword ? Icons.visibility : Icons.visibility_off,
                  onSuffixIconPressed: (){
                    setState(() {
                      isRetypePassword = !isRetypePassword;
                    });
                  },
                ),
            ],
            SizedBox(
              height: 25,
            ),
            CustomTextFileds(
              controller: country, 
              labelText: "Country", 
              hintText: "Enter your country", prefixIcon: Icons.person),
              SizedBox(
                height: 15,
              ),
              CustomTextFileds(
                controller: state, 
                labelText: "State", 
                hintText: "Enter your state", 
                prefixIcon: Icons.home),
              SizedBox(
                height: 15,
              ),
              DropdownMenu(
                initialSelection: selectedCity,
                hintText: 'Enter your city',
                leadingIcon: Icon(Icons.location_city),
                textStyle: TextStyle(fontFamily: 'Poppins',fontSize: 15),
                expandedInsets: EdgeInsets.zero,
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onSelected: (value){
                  setState(() {
                    selectedCity = value;
                  });
                },
                dropdownMenuEntries: cities.map((city){
                  return DropdownMenuEntry(value: city, label: city);
                }).toList()
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFileds(
                controller: streetaddress, 
                labelText: "Enter your street address", 
                hintText: "Street address", 
                prefixIcon: Icons.location_city),
              SizedBox(
                height: 20,
              ),
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
                      
                    )
                  ]
                ),
                child: OutlinedButton(onPressed: () async{
                    try{
                      await ref.read(userProvider.notifier).updateUser(
                        firstName: firstName.text, 
                        lastName: lastName.text, 
                        email: email.text, 
                        phone: phoneno.text, 
                        password: oldPassword.text, 
                        country: country.text, 
                        stateprovience: state.text, 
                        city: selectedCity ?? "", 
                        streetaddress: streetaddress.text, 
                        
                      );
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated')));
                    }catch (e){
                      print('Error while saving ${e}');
                      
                    }
                }, style: OutlinedButton.styleFrom(
                  side: .none,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Update profile',style: TextStyle(fontFamily: 'Poppins',fontSize: 15),)),
              )
          ],     
        ),
        
      ),
    ),
  );
}
}