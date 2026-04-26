
import 'package:flutter/material.dart';
import '../../widgets/custom_text_fileds.dart';

class ProfileScreenState extends StatefulWidget{

  const ProfileScreenState({super.key});

  @override
  State<ProfileScreenState> createState() => _ProfileScreen();

}

class _ProfileScreen extends State<ProfileScreenState>{

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

  bool showPassword = false;

  final List<String> cities = [
    'Ahmedabad',
    'Vadodara',
    'Delhi',
    'Mumbai',
    'Pune',
    'Jaipur',
  ];

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
                prefixIcon: Icons.lock),
                SizedBox(
                  height: 15,
                ),
                CustomTextFileds(
                  controller: newPassword, 
                  labelText: "New password", 
                  hintText: "Enter new password", 
                  prefixIcon: Icons.lock),
                SizedBox(
                  height: 15,
                ),
                CustomTextFileds(
                  controller: retypePassword, 
                  labelText: "Retype password", 
                  hintText: "Enter new retype password", 
                  prefixIcon: Icons.lock),
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
                hintText: 'Enter your city',
                leadingIcon: Icon(Icons.location_city),
                textStyle: TextStyle(fontFamily: 'Poppins',fontSize: 15),
                expandedInsets: EdgeInsets.zero,
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
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
                      blurRadius: 8,
                      offset: Offset(0, 3)
                    )
                  ]
                ),
                child: OutlinedButton(onPressed: (){

                }, child: Text('Update profile',style: TextStyle(fontFamily: 'Poppins',fontSize: 15),)),
              )
          ],     
        ),
        
      ),
    ),
  );
}
}