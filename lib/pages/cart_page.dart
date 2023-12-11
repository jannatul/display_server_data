import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../pages/checkou_payment_page.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ProductController controller2 = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(title: Text('Cart Page'),
        actions: [
          //Text("TOTAL ITEM: ${cartPageCartController.cartProductList.length}  "),
          ElevatedButton(onPressed: (){
            setState(() {
              //  controller.fetchProductList();
              controller2.displayCart();
              for (var v in controller2.cartProductList){
                print('v.runtimeType ${v.runtimeType}');
                print('v.toString() ${v.toString()}');

              }
             // cartPageCartController.cartProductList.refresh();
              print(' there are ${controller2.cartProductList.length}  product in cart');
            });
          }, child: Text('Click to LOAD Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ),)
          ),

        ],

      ),
      body: ListView.builder(
            //itemCount: cartPageCartController.cartProductBox.length,
            itemCount: controller2.cartProductList.length,
            itemBuilder: (context, index){
              //  controller.productList.refresh();
              // var product = controller.productList[index];

              //  var product = cartPageCartController.cartProductBox.getAt(index);
              var product = controller2.cartProductList[index];

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
                    Text('Stock Quantity: ${product.stockQuantity}') ,
                    ElevatedButton(
                        onPressed:(){
                          setState(() {
                            controller2.removeItemFromCart(product);
                          });


                          } ,

                        child: Text('Remove',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold ),))
                  ],
                ) ,
                isThreeLine: true,
                trailing: Text('Price: ${product.price.toString()}', style: TextStyle(fontSize:15),),

              );

            },
          ),

       floatingActionButton: Column( mainAxisAlignment: MainAxisAlignment.end,
         children: [
           ElevatedButton(onPressed: (){
             setState(() {
               controller2.totalPriceOfCartItem;
                         });},
               child: Text('Click to Load Total Price${controller2.totalPriceOfCartItem}')),
           Text('Total Price: ${controller2.totalPriceOfCartItem}'),
           ElevatedButton(onPressed: (){Get.to(()=>CheckoutPaymentPage());}, child: Text('Proceed To CHECKOUT'))
         ],),


    );
  }
}
