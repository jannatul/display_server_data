import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';

//==========Note: This page is not used===== I used dialogue instead of this page
class SignUpCompletePage extends StatefulWidget {
  SignUpCompletePage({super.key});

  @override
  State<SignUpCompletePage> createState() => _SignUpCompletePageState();
}

class _SignUpCompletePageState extends State<SignUpCompletePage> {
  SignUpController mySignUpCompleteController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up Complete'),elevation: 20,backgroundColor: Colors.lightGreenAccent,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello ${mySignUpCompleteController.newUserName}',style: TextStyle(fontWeight: FontWeight.bold, fontSize:20 , color: Colors.purple)),
          Text('Your auto generated ID: ${mySignUpCompleteController.newUserID}',style: TextStyle(fontWeight: FontWeight.bold, fontSize:22 , color: Colors.purple)),




        ],
      ),



    );
  }
}
