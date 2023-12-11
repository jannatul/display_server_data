import 'package:display_server_data/controllers/seller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellersViewPage extends StatefulWidget {
  const SellersViewPage({super.key});

  @override
  State<SellersViewPage> createState() => _SellersViewPageState();
}

class _SellersViewPageState extends State<SellersViewPage> {
  SellerController sellerController1 = Get.put(SellerController());
  @override
  void initState(){
    //loadProduct();
    //controller.fetchProductList();
    // controller.productList.refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text("Sellers List:") ,
            elevation: 20,
            backgroundColor: Colors.purpleAccent,
            actions: [Text("Total: ${sellerController1.sellerList.length} "),
              ElevatedButton(onPressed: (){
                setState(() {
                  //  controller.fetchProductList();
                  sellerController1.sellerList.refresh();
                });
              }, child: Text('View Seller List',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ),)
              ),

            ]
        ),
        body://Obx(()=>
        ListView.builder(
          itemCount: sellerController1.sellerList.length,
          itemBuilder: (context, index){
            //  controller.productList.refresh();
            var seller = sellerController1.sellerList[index];
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
                child: seller.url.isNotEmpty?Image.network('https://demo.alorferi.com${seller.url}'):null,

              ),
              //trailing: Text('Stock Quantity: ${product.stockQuantity.toString()}'),
              title: Text(seller.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ),)  ,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Index: ${index+1}",),
                  Text('ID: ${seller.id}'),

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
