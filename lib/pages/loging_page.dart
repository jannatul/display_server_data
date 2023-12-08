import 'package:display_server_data/controllers/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
LogInController myLogInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In Page"),),
      body: Center(
        child: Column(
          children: [
            Text('User Name',style: TextStyle(fontWeight: FontWeight.bold)),
            TextField( controller: myLogInController.userNameController,  ),
            Text('Password',style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: myLogInController.passWordController,
              obscureText: true, ),

                ElevatedButton(onPressed: (){myLogInController.logInToken();}, child: Text('Log In'))

          ],
        ),
      ),


    );
  }
}
