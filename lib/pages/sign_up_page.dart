import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:display_server_data/controllers/sign_up_controller.dart';
import 'home_page.dart';
import 'package:display_server_data/pages/sign_up_complete_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController mySignUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up Page'),elevation: 20,backgroundColor: Colors.lightGreenAccent,),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           // Text('User Name',style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(controller: mySignUpController.newUserNameController,decoration: InputDecoration(icon: Icon(Icons.account_circle),hintText: 'Enter User Name')), ),
        
           // Text('Valid Email Address',style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(controller: mySignUpController.newEmailController,decoration: InputDecoration(icon: Icon(Icons.email_outlined),hintText: 'Enter Email')), ),
        
            //Text('Password',style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(controller: mySignUpController.newPassWordController,obscureText: true,decoration: InputDecoration(icon: Icon(Icons.password),hintText: 'Enter password')), ),
        
            //Text('CONFIRM Password',style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(controller: mySignUpController.newPassWordConfirmController,obscureText: true,decoration: InputDecoration(icon: Icon(Icons.password),hintText: 'CONFIRM password')), ),
        
            ElevatedButton(onPressed: (){
              mySignUpController.signUp();
              // code to  confirm signup
              showDialog(context: context,
                  builder: (context)=>AlertDialog(
                    title: Text('Congratulations, You have Signed Up  ',style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
                   // content: Text('welcome ${mySignUpController.newUserName}, Your auto generated ID: ${mySignUpController.newUserID}',style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),),
                    actions: [ ElevatedButton(onPressed:  (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            title: Text('Your auto generated ID: ${mySignUpController.newUserID}',style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
                           content: Text('Your Username:  ${mySignUpController.newUserName}',style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),),

                          ));


                    },
                        child: Text('Click To View Your AUTO GENERATED ID',style: TextStyle(color: Colors.deepPurple),)),

                      ElevatedButton(onPressed:  (){ Get.to(()=>HomePage());}, child: Text('Go to HOME PAGE',style: TextStyle(color: Colors.deepPurple),))
                    ],
                  )) ;




              },
                child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green ))),
            // Get.to(()=>SignUpCompletePage());

          ],
        ),
      ),



    );
  }
}
