import 'package:display_server_data/backup/cart_controller.dart';
import 'package:display_server_data/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:display_server_data/pages/loging_page.dart';
import '../controllers/product_controller.dart';
import '../pages/checkout_payment_page.dart';
import '../pages/my_products_list_page.dart';

class ProductListPage extends StatefulWidget {

// ProductController controller = Get.put(ProductController());
   ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ProductController controller = Get.put(ProductController());

/*
  void loadProduct() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      controller.fetchProductList();
   // controller.productList.refresh();
    });
  }

 */
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
      drawer:Drawer(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            TextButton(onPressed: (){Get.to(()=>MyProductListPage());}, child: Text("My Product List",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),

            TextButton(onPressed: (){Get.to(()=>MyProductListPage());}, child: Text("Sellers-build",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            ElevatedButton(style: ButtonStyle(),onPressed: (){}, child: Text("Additional Feature",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red)))

          ],
            ),
        ),
        backgroundColor: Colors.lightGreenAccent,
        elevation: 30,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.deepPurple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ) ,
      appBar: AppBar(elevation: 20,
       // title: Text("Product List: ${controller.productList.length} Item") ,
      actions: [Text("Total: ${controller.productList.length}"),
        ElevatedButton(onPressed: (){
          setState(() {
          //  controller.fetchProductList();
             controller.productList.refresh();
          });
      }, child: Text(' LOAD Product List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ),)
        ),
        IconButton( tooltip: 'Shopping Cart', icon: Icon( Icons.shopping_cart,size: 30,color: Colors.deepOrange,),onPressed: (){Get.to(()=>CartPage());},),
        Text('(${controller.cartProductList.length})', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, ),)

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
                  ElevatedButton(
                      onPressed:(){
                        controller.addToCart(product);
                        //Get.to(()=>LoginPage());
                      },
                      child: Text('Add To Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),))],
              ) ,
              isThreeLine: true,

            );

          },

        )
      //  )  // obx
    );
  }
}

