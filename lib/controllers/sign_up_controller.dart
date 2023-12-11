import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as httpJannatul;

class SignUpController extends GetxController{

  final TextEditingController newUserNameController =TextEditingController();
  final TextEditingController newEmailController=TextEditingController();
  final TextEditingController newPassWordController=TextEditingController();
  final TextEditingController newPassWordConfirmController=TextEditingController();
  late final  newUserID;
  late final newUserName;
  @override
  void onInit() {
    //logInToken ();
    signUp();
    super.onInit();
  }

  Future<void> signUp()async {
    var newUserInformation;
    final urlsignUp = Uri.parse("https://demo.alorferi.com/api/register");
    Map signUpInformation=
    {"name" : newUserNameController.text.trim(),
      "email":  newEmailController.text.trim(),
      "password": newPassWordController.text,
      "password_confirmation": newPassWordConfirmController.text
    };
    // if(){
    //   // check if password and confirmPassword matches .
    // }
    print("=======> before signUpResponse ====================================================== ");
    var signUpResponse= await httpJannatul.post(urlsignUp,body: signUpInformation  );
    print("=======> signUpResponse ====================================================== ");
    print(signUpResponse.statusCode);
    print(signUpResponse.body);
    if(signUpResponse.statusCode ==200){
      print('====================>signUpResponse    successful');
      var newUserRawData =signUpResponse.body;

      Map dataMapNewUser= json.decode(signUpResponse.body);

      newUserInformation= dataMapNewUser['data']; // = {"id":"b62a7fa3-0abe-4e6c-8f48-74a156c819c1","name":"jannatul_app5","url":null}

      newUserID= newUserInformation['id'];
      newUserName= newUserInformation['name'];

      print('welcome $newUserName, Your auto generated ID: $newUserID');
    } else {
      print('====================> signUp  Failed');
    }


  }
}