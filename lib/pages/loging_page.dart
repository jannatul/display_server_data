import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:display_server_data/controllers/log_in_controller.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
LogInController myLogInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In Page"),elevation: 20,backgroundColor: Colors.purpleAccent,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('User Name',style: TextStyle(fontWeight: FontWeight.bold)),
            TextField( controller: myLogInController.userNameController,decoration: InputDecoration(icon: Icon(Icons.abc_outlined),hintText: 'Enter Name'),  ),
            Text('Password',style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: myLogInController.passWordController,
                decoration: InputDecoration(icon: Icon(Icons.password),hintText: 'Enter Password'),
              obscureText: true, ),

                ElevatedButton(onPressed: (){myLogInController.logInToken();}, child: Text('Log In', style: TextStyle(fontWeight: FontWeight.bold),))

          ],
        ),
      ),


    );
  }
}
