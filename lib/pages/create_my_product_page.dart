import 'package:display_server_data/controllers/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_products_controller.dart';
import '../models/product.dart';
import 'my_products_list_page.dart';

class CreateMyProductPage extends StatelessWidget {
  CreateMyProductPage({super.key});
  MyProductController createMyProductController = Get.put(MyProductController());
  LogInController creatProductPageLoginController = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New Product Page'),elevation: 15,backgroundColor: Colors.orangeAccent,),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [ //SizedBox(child: mage.network('https://demo.alorferi.com${editProduct.url}'), height: 60,width: 60,),  createNewProductId
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: TextField(controller: createMyProductController.createNewProductId,decoration: InputDecoration(label: Text('ID'), icon: Icon(Icons.ac_unit_outlined),hintText: 'Enter New Product ID'),),
            // ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(controller: createMyProductController.editProductName,decoration: InputDecoration(icon: Icon(Icons.abc_outlined),hintText: 'Enter New Product Name'),),
            ),
            Text('Enter Price: '),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child:TextField(controller: createMyProductController.editPrice,decoration: InputDecoration(icon: Icon(Icons.price_change,color: Colors.purple,),hintText: 'Enter Price')), ),
            Text('Enter Stock Quantity:'),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(controller: createMyProductController.editStockQuantity,decoration: InputDecoration(icon: Icon(Icons.production_quantity_limits),hintText: 'Enter Quantity' ),),
            ),

            ElevatedButton(

              child: Text('Submit',style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),),
              onPressed: (){
                if(createMyProductController.editProductName.text.isEmpty || createMyProductController.editPrice.text.isEmpty||createMyProductController.editStockQuantity.text.isEmpty)
                {
                  Get.snackbar('Error', 'Please Enter All fields',backgroundColor: Colors.orangeAccent,duration: Duration(seconds: 5));
                }
                else if(createMyProductController.editProductName.text.isNotEmpty && createMyProductController.editPrice.text.isNotEmpty && createMyProductController.editStockQuantity.text.isNotEmpty)
                {
                  createMyProductController.createMyProduct();

                  Get.snackbar('Success', 'Product Create Successful',);
                  createMyProductController.fetchMyProductList(creatProductPageLoginController.accessToken.value);
                  createMyProductController.myProductList.refresh();
                  Get.to(()=>MyProductListPage());
                }
                else{}
              },
            ),



          ],
        ),
      ),
    );
  }
}
