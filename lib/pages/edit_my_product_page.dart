import 'package:display_server_data/pages/my_products_list_page.dart';
import 'package:flutter/material.dart';
import 'package:display_server_data/controllers/my_products_controller.dart';
import 'package:get/get.dart';

import '../models/product.dart';

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
                  Get.snackbar('Error', 'Please Enter All fields',backgroundColor: Colors.orangeAccent,duration: Duration(seconds: 5));
                }
                else if(editMyProductController.editProductName.text.isNotEmpty && editMyProductController.editPrice.text.isNotEmpty && editMyProductController.editStockQuantity.text.isNotEmpty)
                {
                  editMyProductController.editMyProduct(editProduct);
                  Get.snackbar('Success', 'Product Edit Successful',
                      backgroundColor: Colors.purpleAccent,
                      borderColor: Colors.black87,
                      borderRadius: 5);

                  Get.to(MyProductListPage());
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
