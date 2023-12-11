import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import 'package:display_server_data/pages/my_products_list_page.dart';
import 'package:display_server_data/controllers/my_products_controller.dart';

class EditMyProductPage extends StatelessWidget {
  Product editProduct;
  EditMyProductPage({super.key, required this.editProduct});

  MyProductController editMyProductController = Get.put(MyProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product Page'),),
      body: SafeArea(
        child: Column(
          children: [ SizedBox(child: Image.network('https://demo.alorferi.com${editProduct.url}'), height: 60,width: 60,),
            Text('Current Name: ${editProduct.name}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: editMyProductController.editProductName,decoration: InputDecoration(icon: Icon(Icons.abc_outlined),hintText: 'Enter Product Name'),),
            ),
            Text('Current Price: ${editProduct.price.toString()}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextField(controller: editMyProductController.editPrice,decoration: InputDecoration(icon: Icon(Icons.price_change),hintText: 'Enter Price')), ),
            Text('Current Stock Quantity: ${editProduct.stockQuantity}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: editMyProductController.editStockQuantity,decoration: InputDecoration(icon: Icon(Icons.production_quantity_limits),hintText: 'Enter Quantity' ),),
            ),

            ElevatedButton(
              child: Text('Submit'),
              onPressed: (){

                if(editMyProductController.editProductName.text.isEmpty || editMyProductController.editPrice.text.isEmpty||editMyProductController.editStockQuantity.text.isEmpty)
                {
                //  Get.snackbar('Error', 'Please Enter All fields',backgroundColor: Colors.orangeAccent,duration: Duration(seconds: 5));
                  Get.snackbar('Error', 'Please Enter All fields');
                }
               // else if(editMyProductController.editProductName.text.isNotEmpty && editMyProductController.editPrice.text.isNotEmpty && editMyProductController.editStockQuantity.text.isNotEmpty)
                else
                {
                  editMyProductController.editMyProduct(editProduct);
                  Get.snackbar('Success', 'Product Edit Successful',);

                  // Get.to(()=>HomePage());
                   Get.to(()=>MyProductListPage());
                }
             //   else{}
                },
            ),



          ],
        ),
      ),
    );
  }
}
