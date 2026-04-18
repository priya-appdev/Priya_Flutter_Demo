
import 'package:flutter/material.dart';
import 'package:counter_app/app_demo/screens/product/product_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/user/user_provider.dart';
import '../riverpod/product/product_provider.dart';
import '../screens/cart/cart_screen.dart';


class TabbarControllerPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<TabbarControllerPage> createState() => _TabBarControllerPage();
  }

  class _TabBarControllerPage extends ConsumerState<TabbarControllerPage> with TickerProviderStateMixin{

    late TabController _tabController;
    late TextEditingController namecontroller;
    late TextEditingController emailcontroller;
    late TextEditingController phonecontroller;

    @override
    void initState(){
      super.initState();

      _tabController = TabController(length: 3, vsync: this);

      namecontroller = TextEditingController();
      emailcontroller = TextEditingController();
      phonecontroller = TextEditingController();

      Future.microtask((){
        ref.read(userProvider.notifier).loadUser();
      });
    }

    @override
    void dispose(){
      _tabController.dispose();
      namecontroller.dispose();
      emailcontroller.dispose();
      phonecontroller.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context){

      return Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [

              ProductRiverpodPage(),
              CartRiverPodPage(),
              _buildRegistrationPage(),

        ]),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.green,
          tabs: [
           Tab(
                icon: Icon(Icons.library_add),
                text: 'Product',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: 'Cart',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              )
        ]),
        
      );
    }

    Widget _buildRegistrationPage(){
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon: Icon(Icons.person)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration data saved')),
                );
            }, child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Save Registartion'),
            ))
          ],
        ),
      );
    }

  }