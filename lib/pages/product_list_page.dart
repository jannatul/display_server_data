
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductListPage extends StatelessWidget {

// ProductController controller = Get.put(ProductController());
   ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
  //  controller.fetchProductList();
    return Scaffold(
      floatingActionButton: IconButton( tooltip: 'Shopping Cart',
        icon: Icon( Icons.shopping_cart,size: 30,color: Colors.deepOrange,),onPressed: (){},),
      //Text('Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color:  Colors.purple),),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      appBar: AppBar(title: Text("All Product List"),),
      body: Obx(()=> ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index){
            var product = controller.productList[index];
        //print("=======================>All Product List: Total Item ${controller.productList.length}");
        // return Card(
        //   child: Container(),
        // );

        return ListTile(
          minVerticalPadding: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),),
          onTap: (){},
          leading:SizedBox(height: 100,width:100,
            child: product.url.isNotEmpty?Image.network('https://demo.alorferi.com${product.url}'):null,

          ),
          //trailing: Text('Stock Quantity: ${product.stockQuantity.toString()}'),
          title: Text(product.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ),)  ,
          subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("ID: ${index+1}",),
                                  Text('Price: ${product.price.toString()}'),
                                  Text('Stock Quantity: ${product.stockQuantity.toString()}') ,
                                    ElevatedButton(onPressed:(){}, child: Text('Add To Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),))],
                    ) ,
          isThreeLine: true,

        );

      },

      )
      ) ,
    );
  }
}

