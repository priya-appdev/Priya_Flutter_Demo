// import 'package:counter_app/model/provider.model.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/user/user_provider.dart';
import '../../widgets/custom_text_fileds.dart';
import '../../main/tabbar_screen.dart';

// class RegistrationDemopage extends StatefulWidget {
//   @override
//   const RegistrationDemopage({super.key});

//   State<RegistrationDemopage> createState() => _RegistrationPageDemo();
// }

class RegistrationScreen extends ConsumerStatefulWidget {
  @override
  const RegistrationScreen({super.key});
  ConsumerState<RegistrationScreen> createState() => _RegistrationPageDemo();
}

// class _RegistrationPageDemo extends State<RegistrationScreen> {
//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   TextEditingController emailAddress = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController retypepassword = TextEditingController();
//   TextEditingController phoneno = TextEditingController();
//   TextEditingController contryName = TextEditingController();
//   TextEditingController stateName = TextEditingController();
//   TextEditingController streetAddress = TextEditingController();
//   TextEditingController message = TextEditingController();

//   bool isShowpassword = true;
//   bool isRetypepassword = true;
//   String? selectedCity;

//   final List<String> cities = [
//     'Ahmedabad',
//     'Vadodara',
//     'Delhi',
//     'Mumbai',
//     'Pune',
//     'Jaipur'
//   ];

//   @override
//   void initState(){
//     super.initState();
//     final userprovider = context.read<UserProvider>();
//     firstName.text = userprovider.getFirstname;
//     lastName.text = userprovider.getLastname;
//     emailAddress.text = userprovider.getEmail;
//     print('Loaded Last Name: ${userprovider.getLastname}');
//   }

//   @override
//   void dispose(){
//     firstName.dispose();
//     lastName.dispose();
//     emailAddress.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registarion'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(18),
//         child: SingleChildScrollView(
//           clipBehavior: Clip.none,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: firstName,
//                 decoration: InputDecoration(
//                   labelText: 'First name',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your first name',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.person),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: lastName,
//                 decoration: InputDecoration(
//                   labelText: 'Last name',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your last name',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.person),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email address',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your email address',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: phoneno,
//                 decoration: InputDecoration(
//                   labelText: 'Phone no',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your phone no',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.phone),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: password,
//                 obscureText: isShowpassword,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your password',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isShowpassword = !isShowpassword;
//                       });
//                     },
//                     icon: Icon(
//                       isShowpassword ? Icons.visibility : Icons.visibility_off,
//                     ),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: retypepassword,
//                 obscureText: isRetypepassword,
//                 decoration: InputDecoration(
//                   labelText: 'Retype password',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your retype password',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isRetypepassword = !isRetypepassword;
//                       });
//                     },
//                     icon: Icon(
//                       isRetypepassword
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               TextFormField(
//                 controller: contryName,
//                 decoration: InputDecoration(
//                   labelText: 'Country',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your country name',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.map),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               // DropdownButtonFormField(
//               //   value: selectedCity,
//               //   hint: Text('Select city',style: TextStyle(fontFamily: 'Poppins',fontSize: 15),),
//               //   decoration: InputDecoration(
//               //     labelText: 'Select city',
//               //     labelStyle: TextStyle(fontFamily: 'Poopins',fontSize: 15),
//               //     border: OutlineInputBorder(
//               //       borderRadius: BorderRadius.circular(10)
//               //     ),

//               //   ),
//               //   isExpanded: true,
//               //   items: cities.map((city){
//               //   return DropdownMenuItem(value: city,child: Text(city,style: TextStyle(fontFamily: 'Poppins',fontSize: 15),));
//               // }).toList(), onChanged: (value){
//               //   setState(() {
//               //     selectedCity = value;
//               //   });
//               // }),
//               // SizedBox(
//               //   height: 15,
//               // ),
//               TextFormField(
//                 controller: stateName,
//                 decoration: InputDecoration(
//                   labelText: 'State',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your state name',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.map),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               DropdownMenu(
//                 hintText: 'Select city',
//                 leadingIcon: Icon(Icons.location_city),
//                 textStyle: TextStyle(fontFamily: 'Poppins',fontSize: 15),
//                 expandedInsets: EdgeInsets.zero,
//                 inputDecorationTheme: InputDecorationTheme(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   )
//                 ),
//                 dropdownMenuEntries: cities.map((city){
//                   return DropdownMenuEntry(value: city, label: city);
//                 }).toList()
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 controller: streetAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Street address',
//                   labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   hintText: 'Enter your street address',
//                   hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   prefixIcon: Icon(Icons.map),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               SizedBox(
//                   height: 100,
//                   child: Stack(
//                     children: [
//                       TextField(
//                         controller: message,
//                         minLines: 4,
//                         maxLines: null,
//                         textAlignVertical: TextAlignVertical.top,
//                         decoration: InputDecoration(
//                           labelText: 'Message',
//                           labelStyle: TextStyle(
//                             fontFamily: 'Poppins',fontSize: 15
//                           ),
//                           hintText: 'Enter message',
//                           hintStyle: TextStyle(
//                             fontFamily: 'Poppins',fontSize: 15
//                           ),
//                           contentPadding: EdgeInsets.fromLTRB(50, 16, 12, 12),
//                           alignLabelWithHint: true,
//                            border: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(10),
//                             ),
//                         ),
//                       ),
//                       Positioned(left:12,top: 16,
//                       child: Icon(Icons.message,size: 24,))
//                     ],
//                   ),
//               ),
//               SizedBox(height: 15),
//               Container(
//                 // alignment: Alignment.center,
//                 width: double.infinity,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),

//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       offset: Offset(0, 3),
//                       blurRadius: 8,
//                     ),
//                   ],
//                 ),
//                 child: OutlinedButton(
//                   onPressed: () async{

//                     final error = _validateFields();

//                     if (error != null){
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(error)),
//                       );
//                       return;
//                     }else{

//                       await context.read<UserProvider>().register(
//                         firstname: firstName.text,
//                         lastname: lastName.text,
//                         emailID: emailAddress.text,
//                         phonnumber: phoneno.text,
//                         password: password.text,
//                         retypepassword: retypepassword.text,
//                         country: contryName.text,
//                         state: stateName.text,
//                         city: selectedCity ?? "",
//                         streetAddress: streetAddress.text,
//                         message: message.text
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Registration successfull'))
//                       );
//                       //  Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => ExamplePageState(),
//                     //   ),
//                     // );
//                     // final userProvider = context.read<UserProvider>();
//                     // userProvider.setUser(
//                     //   firstName.text,
//                     //   lastName.text,
//                     //   emailAddress.text,
//                     //   phoneno.text,
//                     //   password.text,
//                     //   retypepassword.text,
//                     //   contryName.text,
//                     //   stateName.text,
//                     //   selectedCity ?? "",
//                     //   streetAddress.text,
//                     //   message.text
//                     // );
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => TabbarControllerPage())
//                       );
//                     }
//                     // if (firstName.text.isEmpty) {
//                     //   showAlert('Please enter first name');
//                     //   return;
//                     // } else if (lastName.text.isEmpty) {
//                     //   showAlert('Please enter last name');
//                     //   return;
//                     // } else if (emailAddress.text.isEmpty) {
//                     //   showAlert('Please enter email address');
//                     //   return;
//                     // } else if (phoneno.text.isEmpty) {
//                     //   showAlert('Please enter phone no');
//                     //   return;
//                     // } else if (password.text.isEmpty) {
//                     //   showAlert('Please enter password');
//                     //   return;
//                     // } else if (retypepassword.text.isEmpty) {
//                     //   showAlert('Please ennter retype password');
//                     //   return;
//                     // } else if (contryName.text.isEmpty) {
//                     //   showAlert('Please ennter country name');
//                     //   return;
//                     // } else if (stateName.text.isEmpty) {
//                     //   showAlert('Please ennter state name');
//                     //   return;
//                     // } else if (streetAddress.text.isEmpty) {
//                     //   showAlert('Please ennter street address');
//                     //   return;
//                     // } else {
//                     //   showDialog(
//                     //     context: context,
//                     //     builder: (_) =>
//                     //         Center(child: CircularProgressIndicator()),
//                     //   );
//                     //   Future.delayed(Duration(seconds: 2), () {
//                     //     Navigator.pop(context);
//                     //     showDialog(
//                     //       context: context,
//                     //       builder: (context) {
//                     //         return AlertDialog(
//                     //           title: Text('Success'),
//                     //           content: Text('Registration suceessful'),
//                     //           actions: [
//                     //             TextButton(
//                     //               onPressed: () {
//                     //                 Navigator.pop(context);
//                     //                 Navigator.pushReplacement(
//                     //                   context,
//                     //                   MaterialPageRoute(
//                     //                     builder: (context) => LoginpageState(),
//                     //                   ),
//                     //                 );
//                     //               },
//                     //               child: Text('OK'),
//                     //             ),
//                     //           ],
//                     //         );
//                     //       },
//                     //     );
//                     //   });
//                     // }
//                   },
//                   style: OutlinedButton.styleFrom(
//                     side: .none,
//                     backgroundColor: Colors.white,
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Text(
//                     'Register',
//                     style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showAlert(String messgae) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Invalid'),
//           content: Text(messgae),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 'OK',
//                 style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   String? _validateFields(){

//     if (firstName.text.isEmpty) return 'Please enter first name';

//     if (lastName.text.isEmpty) return 'Please enter last name';

//     if (emailAddress.text.isEmpty) return 'Please enter email address';

//     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailAddress.text)){
//       return 'Please enter valid email';
//     }

//     if (phoneno.text.isEmpty) return 'Please enter a phone no';

//     if (!RegExp(r'^[0-9]{10}$').hasMatch(phoneno.text)){
//       return 'Please enter valid phone no';
//     }

//     if (password.text.isEmpty) return 'Please enter password';

//     if (password.text.length < 6) return 'Password must be at last 6 characters';

//     if (retypepassword.text.isEmpty) return 'Please enter retype password';

//     if (retypepassword.text != password.text) return 'Password and retype password does not match';

//     if (contryName.text.isEmpty) return 'Please enter country name';

//     if (stateName.text.isEmpty) return 'Please enter state name';

//     if (streetAddress.text.isEmpty) return 'Please enter street address';

//     if (message.text.isEmpty) return 'Please enter messge';

//   }
// }

class _RegistrationPageDemo extends ConsumerState<RegistrationScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController retypepassword = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController contryName = TextEditingController();
  TextEditingController stateName = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController message = TextEditingController();

  bool isShowpassword = true;
  bool isRetypepassword = true;
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
  void initState() {
    super.initState();
    Future.microtask(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registarion'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              CustomTextFileds(
                controller: firstName,
                labelText: 'First name',
                hintText: 'Enter your first name',
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: lastName,
                labelText: 'Last name',
                hintText: 'Enter your last name',
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: emailAddress,
                labelText: 'Email',
                hintText: 'Enter your email address',
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: phoneno,
                labelText: 'Phone numbet',
                hintText: 'Enter your phone number',
                prefixIcon: Icons.phone,
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: password,
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock,
                obsecureText: isShowpassword,
                suffixIcon: isShowpassword ? 
                    Icons.visibility : Icons.visibility_off,
                onSuffixIconPressed: (){
                  setState(() {
                    isShowpassword = !isShowpassword;
                  });
                }
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: retypepassword,
                labelText: 'Retype password',
                hintText: 'Enter your retype password',
                prefixIcon: Icons.lock,
                obsecureText: isRetypepassword,
                suffixIcon: isRetypepassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                onSuffixIconPressed: () {
                  setState(() {
                    isRetypepassword = !isRetypepassword;
                  });
                },
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: contryName,
                labelText: 'Country name',
                hintText: 'Enter your country name',
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: stateName,
                labelText: 'State name',
                hintText: 'Enter your state name',
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 15),
             DropdownMenu<String>(
                hintText: 'Select city',
                leadingIcon: Icon(Icons.location_city),
                textStyle: TextStyle(fontFamily: 'Poppins',fontSize: 15),
                expandedInsets: EdgeInsets.zero,
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                dropdownMenuEntries: cities.map((city){
                  return DropdownMenuEntry(value: city, label: city);
                }).toList(),
                onSelected: (value) {
                  setState(() => selectedCity = value);
                },
              ),
              SizedBox(height: 15),
              CustomTextFileds(
                controller: streetAddress,
                labelText: 'Street address',
                hintText: 'Enter your street address',
                prefixIcon: Icons.home,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    TextField(
                      controller: message,
                      maxLines: null,
                      minLines: 4,
                      
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15
                        ),
                        labelText: 'Enter your message',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15
                        ),

                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.fromLTRB(50, 16, 12, 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                      ),
                    ),
                    Positioned(left:12,top: 16,
                      child: Icon(Icons.message,size: 24,))
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                // alignment: Alignment.center,
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
                  onPressed: () async {
                    final error = _validateFields();

                    if (error != null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error))
                      );
                      return;
                    }

                    showDialog(
                      context: context, 
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      )
                    );
                    try{
                        await ref.read(userProvider.notifier)
                        .setUser(
                            firstName: firstName.text,
                            lastName: lastName.text,
                            email: emailAddress.text,
                            phone: phoneno.text,
                            password: password.text,
                            country: contryName.text,
                            stateprovience: stateName.text,
                            city: selectedCity ?? "",
                            streetAddress: streetAddress.text,
                            message: message.text,
                          );
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration successful'))
                        );
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabbarControllerPage(),
                        ),
                      );
                    }catch (e){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e'))
                      );
                    }

                    // if (error != null) {
                    //   ScaffoldMessenger.of(
                    //     context,
                    //   ).showSnackBar(SnackBar(content: Text(error)));
                    //   return;
                    // } else {
                    //   await ref
                    //       .read(userProvider.notifier)
                    //       .setUser(
                    //         firstName: firstName.text,
                    //         lastName: lastName.text,
                    //         email: emailAddress.text,
                    //         phone: phoneno.text,
                    //         password: password.text,
                    //         retypepassword: retypepassword.text,
                    //         country: contryName.text,
                    //         stateprovience: stateName.text,
                    //         city: selectedCity ?? "",
                    //         streetAddress: streetAddress.text,
                    //         message: message.text,
                    //       );
                    //   await Future.delayed(const Duration(seconds: 5));
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Registration successful'))
                    //   );
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => TabbarControllerPage(),
                    //     ),
                    //   );
                    // }
                  },
                  style: OutlinedButton.styleFrom(
                    side: .none,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateFields() {
    if (firstName.text.isEmpty) return 'Please enter first name';

    if (lastName.text.isEmpty) return 'Please enter last name';

    if (emailAddress.text.isEmpty) return 'Please enter email address';

    if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(emailAddress.text)) {
      return 'Please enter valid email';
    }

    if (phoneno.text.isEmpty) return 'Please enter a phone no';

    if (!RegExp(r'^[0-9]{10}$').hasMatch(phoneno.text)) {
      return 'Please enter valid phone no';
    }

    if (password.text.isEmpty) return 'Please enter password';

    if (password.text.length < 6)
      return 'Password must be at last 6 characters';

    if (retypepassword.text.isEmpty) return 'Please enter retype password';

    if (retypepassword.text != password.text)
      return 'Password and retype password does not match';

    if (contryName.text.isEmpty) return 'Please enter country name';

    if (stateName.text.isEmpty) return 'Please enter state name';

    if (streetAddress.text.isEmpty) return 'Please enter street address';

    if (message.text.isEmpty) return 'Please enter messge';
  }
}
