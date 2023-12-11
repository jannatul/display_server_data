import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:display_server_data/controllers/my_products_controller.dart';
import 'package:display_server_data/pages/create_my_product_page.dart';
import 'package:display_server_data/pages/edit_my_product_page.dart';
import 'package:display_server_data/controllers/log_in_controller.dart';

class MyProductListPage extends StatefulWidget {
   MyProductListPage({super.key});

  @override
  State<MyProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<MyProductListPage> {
LogInController logInController = Get.put(LogInController());

MyProductController myProductController= Get.put(MyProductController());

  @override
  Widget build(BuildContext context) {
     // myProductController.fetchMyProductList(logInController.accessToken.value);

    return Scaffold(
      appBar: AppBar(elevation: 20,backgroundColor: Colors.purpleAccent,

        actions: [
          ElevatedButton(onPressed: (){Get.to(()=>CreateMyProductPage());}, child: Text("CREATE NEW Product",style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),)),

        ElevatedButton( child: Text("LOAD My Products"),
                       onPressed: (){
                          setState(() {
                                //  myProductController.fetchMyProductList(logInController.accessToken.value);
                                     myProductController.myProductList.refresh();
                                });
    }), 
      Text('${myProductController.myProductList.length}')],
      ),
          //title: Text("My Product Page")),
      body: Obx(()=>
          ListView.builder(
            itemCount: myProductController.myProductList.length,
            itemBuilder: (context, index){
              //  controller.productList.refresh();
              var product = myProductController.myProductList[index];
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
                  children: [Text("ID: ${product.id}",),
                    Text('Price: ${product.price.toString()}'),
                    Text('Stock Quantity: ${product.stockQuantity.toString()}') ,
                    ElevatedButton(
                        onPressed:(){
                          // code to edit product
                          // myProductController.editMyProduct(product);
                          Get.to(()=>EditMyProductPage(editProduct: product,));

                        },
                        child: Text('Edit',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
                    ElevatedButton(
                        onPressed:(){

                          // code to delete product
                          showDialog(context: context,
                              builder: (context)=>AlertDialog(
                                title: Text('CONFIRM PRODUCT DELETE ',style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                                content: Text('Are You Sure you want to DELETE this product?',style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),),
                                actions: [
                                  TextButton(onPressed: (){
                                    myProductController.deleteMyProduct(product);
                                    Navigator.of(context).pop();
                                    } ,
                                      child: Text('YES',style: TextStyle(color: Colors.red),)),
                                  TextButton(onPressed:  (){Navigator.of(context).pop();}, child: Text('NO',style: TextStyle(color: Colors.deepPurple),))
                                ],
                              )) ;
                          // myProductController.deleteMyProduct(product);
                        },
                        child: Text('Delete',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),))


                  ],
                ) ,
                isThreeLine: true,

              );

            },

          )
      ),

    );
  }
}
