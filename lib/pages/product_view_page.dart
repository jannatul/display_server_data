import 'package:display_server_data/backup/cart_controller.dart';
import 'package:display_server_data/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:display_server_data/pages/loging_page.dart';
import '../controllers/product_controller.dart';
import 'checkout_payment_page.dart';
import 'my_products_list_page.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  ProductController controller = Get.put(ProductController());

  @override
  void initState(){
    //loadProduct();
    //controller.fetchProductList();
    // controller.productList.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  controller.fetchProductList();
    return Scaffold(
        appBar: AppBar(
            title: Text("Products") ,
            elevation: 20,
            backgroundColor: Colors.purpleAccent,
          // title: Text("Product List: ${controller.productList.length} Item") ,
            actions: [Text("Total: ${controller.productList.length} "),
              ElevatedButton(onPressed: (){
                setState(() {
                  //  controller.fetchProductList();
                  controller.productList.refresh();
                });
              }, child: Text('View Product List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ),)
              ),

            ]
        ),
        body://Obx(()=>
        ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index){
            //  controller.productList.refresh();
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
],
              ) ,
              isThreeLine: true,

            );

          },

        )
      //  )  // obx
    );
  }
}
