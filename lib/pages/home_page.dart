import 'package:display_server_data/pages/product_view_page.dart';
import 'package:display_server_data/pages/sellers_view_page.dart';
import 'package:display_server_data/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loging_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('JANNATUL-MARKETPLACE Home'),elevation: 20,backgroundColor: Colors.purpleAccent,),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){Get.to(()=>ProductViewPage());}, child: Text('View Products List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple ))),
          ElevatedButton(onPressed: (){Get.to(()=>SellersViewPage());}, child: Text('View Sellers List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple ))),
          ElevatedButton(onPressed: (){Get.to(()=>LoginPage());}, child: Text('Sign In to buy products and enjoy other Services',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ))),
          ElevatedButton(onPressed: (){Get.to(()=>SignUpPage());}, child: Text('If you do not have an account Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange ))),
        ],
      ),
    );
  }
}
