import 'package:display_server_data/controllers/product_controller.dart';
import 'package:display_server_data/pages/payment_complete_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckoutPaymentPage extends StatefulWidget {
  CheckoutPaymentPage({super.key});

  @override
  State<CheckoutPaymentPage> createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
ProductController controllerPayment = ProductController();
String selectedPaymentOption='None';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment Page"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text('Please Select Payment Method', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Payable Amount: ৳${controllerPayment.totalPriceOfCartItem}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                RadioMenuButton(
                    value: 'Bkash',
                    groupValue: selectedPaymentOption,
                    onChanged:(selectedValue){
                      setState(() {
                        selectedPaymentOption=selectedValue!;
                    });},
                    child: Row(children: [
                      Text('Bkash'),
                      SizedBox(height: 50, width:50,child: Image.asset('assets/payment_page_logo/bkash_logo.png'))],),
                       style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.lightGreenAccent),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    )
                  ),
                ),
                SizedBox(height: 10,),
                RadioMenuButton(
                  value: 'Nogod',
                  groupValue: selectedPaymentOption,
                  onChanged:(selectedValue){
                    setState(() {
                      selectedPaymentOption=selectedValue!;
                    });},
                  child: Row(children: [
                    Text('Nogod'),
                    SizedBox(height: 50, width:50,child: Image.asset('assets/payment_page_logo/nagad_logo.png'))],),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.lightGreenAccent),
                      shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                RadioMenuButton(
                  value: 'Stripe',
                  groupValue: selectedPaymentOption,
                  onChanged:(selectedValue){
                    setState(() {
                      selectedPaymentOption=selectedValue!;
                    });},
                  child: Row(children: [
                    Text('Stripe'),
                    SizedBox(height: 50, width:50,child: Image.asset('assets/payment_page_logo/stripe_logo.png'))],),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.lightGreenAccent),
                      shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){Get.to(()=>PaymentCompletePage());},
                  child:Text('Complete Payment', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.green),),)


              ],

            ),
          ),
        ),
      ),


    );
  }
}
