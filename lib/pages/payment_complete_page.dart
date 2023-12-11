import 'package:display_server_data/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCompletePage extends StatelessWidget {
  const PaymentCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment Complete",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.green))),
      body: Center(
        child: Column(
          children: [
            Text('Thank you for your order. Order Number # 123456', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.purple),),
            SizedBox(height: 10,),
            Text('Your Order will arrive within 7-10 Business Day.', style: TextStyle(fontSize: 15,),),
            SizedBox(height: 10,),
            Text('If you have any Question or Concern-', style: TextStyle(fontSize: 15,),),
            Text('Please Contact Customer Support at 16123.', style: TextStyle(fontSize: 15,color: Colors.cyan),),
            ElevatedButton(onPressed:()=> Get.to(()=>HomePage()), child:  Text('Go to HOME Page', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.purple),),)
          ],
        ),
      )
    );
  }
}
