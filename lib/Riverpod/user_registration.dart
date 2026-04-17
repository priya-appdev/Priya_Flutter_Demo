import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_demo/riverpod/user/user_provider.dart';

class UserFormPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<UserFormPage> createState() => _UserFromPageState();
}

class _UserFromPageState extends ConsumerState<UserFormPage>{

  late TextEditingController namecontroller;

  @override
  void initState(){
    super.initState();
    namecontroller = TextEditingController();

    Future.microtask((){
      ref.read(userProvider.notifier).loadUser();
    });
  }

  @override
  void dispose(){
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: namecontroller,
            onChanged: (value){
              ref.read(userProvider.notifier).updateName(value);
            },
          ),
          ElevatedButton(onPressed: (){

          }, child: Text('Save'))
        ],
      ),
    );
  }
}