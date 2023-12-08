import 'package:display_server_data/pages/loging_page.dart';
import 'package:flutter/material.dart';
import 'pages/product_list_page.dart';
import 'package:get/get.dart';
void main() async {

  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: //LoginPage()
      ProductListPage(),
    );
  }
}

