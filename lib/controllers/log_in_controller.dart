import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as httpJannatul;

import '../pages/my_products_list_page.dart';
import '../pages/product_list_page.dart';

class LogInController extends GetxController{
final TextEditingController userNameController =TextEditingController();
final TextEditingController passWordController=TextEditingController();
var isLoading = false.obs;
bool logInIsSuccessful=false;
var accessToken=''.obs;
@override
void onInit() {
  print("call LogInController onInit");  // this line not printing
  // checkIsLogin();
  logInToken ();
  super.onInit();
}
Future <void> logInToken () async {
  final url = Uri.parse("https://demo.alorferi.com/oauth/token");
  Map authorizationMap= {}.obs;


  Map bodyJ={
    "grant_type": "password",
    "client_id": '2',
    "client_secret":"Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
    "username":userNameController.text.trim(),
    "password": passWordController.text.trim()
  };
  var responseLogIn= await httpJannatul.post(url,body: bodyJ,);
  if (responseLogIn.statusCode==200) {
    authorizationMap = jsonDecode(responseLogIn.body);
    print("hello        ${responseLogIn.body}");
    print( "authorizationMap= jsonDecode(responseLogIn.body)     ${authorizationMap}");
    accessToken.value = authorizationMap['access_token'];
  //  print(accessToken.value);
    logInIsSuccessful=true;
    Get.snackbar('Success', 'Login successful');
    Get.to(()=> ProductListPage());
   // Get.offAll(ProductListPage());
  }

  else{
    Get.snackbar('Login Fail', 'Please Enter Correct Username and Password', backgroundColor:Color(50) );
   // print('status not 200');
  }
}
}