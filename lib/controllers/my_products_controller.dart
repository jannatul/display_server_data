import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as httpJannatul;
import 'package:display_server_data/controllers/log_in_controller.dart';
import 'package:display_server_data/models/product.dart';

import '../pages/edit_my_product_page.dart';

class MyProductController extends GetxController{
//  var accessToken =Get.find(myLogInController.)

var myProductList=[].obs;
LogInController logInController = Get.put(LogInController());
final TextEditingController editProductName =TextEditingController();
final TextEditingController editPrice=TextEditingController();
final TextEditingController editStockQuantity=TextEditingController();
final TextEditingController createNewProductId=TextEditingController();
@override
void onInit() {
  print("call ProdutListController onInit");  // this line not printing
  // checkIsLogin();
  // myLoginController.logInToken();
  fetchMyProductList(logInController.accessToken.value);

  super.onInit();
}
Future<void> fetchMyProductList(String token) async{

  try {
    final url = Uri.parse("https://demo.alorferi.com/api/my-products");
    //Map <String, String>authorizationHeader= {'Content-Type':'application/json', 'Authorization':authorizationToken};
    //print('print from fetchProductList() ');
    //debugPrint("=======> accesstoken :${myLoginController.accessToken} ");
    //var productListResponse= await httpJannatul.get(url,headers:{'Content-Type':'application/json', 'Authorization':'Bearer ${myLoginController.accessToken}'});
    var myProductListResponse= await httpJannatul.get(url,headers:{'Content-Type':'application/json', 'Authorization':'Bearer $token' });
    // var productListResponse= await httpJannatul.get(url,headers:{'Content-Type':'multipart/form-data', 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiMzM1OTA5ODhkMTc0MmYyMDM0MmQ2ODJiNjM2ZDhmOTcwYmY4Y2JlNGU0ZTUxOGE2MmU1YjFmMjYwNTNlZGMyNWRjNDUxMDdiZWNiYmE1ZDUiLCJpYXQiOjE3MDEwNjIxMjkuODg4NzM2LCJuYmYiOjE3MDEwNjIxMjkuODg4NzM5LCJleHAiOjE3MzI2ODQ1MjkuODczNTE1LCJzdWIiOiIwNTE5MDQzZi1iZGNmLTQyYjgtYWIwMC1iOGJhMjIyYTA5Y2QiLCJzY29wZXMiOltdfQ.gxdyo1OakHg1yg0KYKcDjj8iiCcYoc9OBMcOJVOOUefPGVWSRiYpQc8EjCDpiUwMd_NR4PXOzgetRqvEMQa3o6itWlCp9ox-LOU2ZN1AtUaC8Te8Iz46dwLS1OPIsgy3ecW86s8CPrZQaa56LfW3-1IPeiafAxM4WLG-6nKn2rX0ddElxzu_VrM6rPpG5y8mpbzqlt5t1Fsuko_hO8fpiCVvyeKPsUkJ8Am_pLXz57Kp6Kjin8yPa17v01ozcDdQhKkIZRSjTRc682mnQbD9TdsMXWRLd98ZRlTXoq9RkKNCA0FUJAn4YndGCLbQ1_4TdQOpP7v8p9guRs9yHqIw7aPvKXQU59Iy6qUftSOZ7ReRrxKDyR6KYEOXNtaf3ZHuUJDE-FxpM6u7lWnc3A363nCf3x1uTqbpm7ynEv3AsaJQodJOF9Olxh7fMi0lv_ZNqb4YqemHbWegYVpCqWsZlwKYxfIr39b0Jt-g__zc--dfEYdliMtHBJsN9jiKg416jQt0tjdP9YWuuVdx8_PlrKoWgwKbj21GtTS5A79ZR2G-brrAoT0IrxCe3DIkfvKkJXi5G-yq-el7LtG8zZ3K0yBItaCZcrZpA9B13HlGDuozlzOQNpy9ssuMQ6Z0ggi-o3Lkh2rNVuILc8mFUD5zpRi04kaSGewNsXa8a013JRY'});
    print(myProductListResponse.body);
    Map dataMapMyProductList= json.decode(myProductListResponse.body);
    List<dynamic> dataMyProductListOfMap  = dataMapMyProductList['data'];

    for(var productAsMap in dataMyProductListOfMap) {
      //  print(productAsMap );
      myProductList.value.add(Product(
        //   // productList.add(Product(
          id: productAsMap["id"],
          name: productAsMap['name'],
          price: productAsMap['price'],
          stockQuantity: productAsMap['stock_quantity'],
          url: productAsMap['url']??'/images/blank_product_picture.png'
      ));
    }

  }
  catch(e,s){
    print("error : $e STACKTRACE: $s");
  }
}


editMyProduct(Product editableProduct) async {
  //final url2 = Uri.parse("https://demo.alorferi.com/api/my-products/18");
  final url2 = Uri.parse("https://demo.alorferi.com/api/my-products/${editableProduct.id}");
 // Get.to(()=>EditMyProductPage(editableProduct));
  //  Map <String, String>authorizationHeaderEditProduct= {'Content-Type':'multipart/form-data', 'Authorization':authorizationToken};
  Map <String, String>authorizationHeaderEditProduct= { 'Authorization':'Bearer ${logInController.accessToken.value}'};
  Map editProduct1={'id': '${editableProduct.id}', 'name': '${editProductName.text}','price': '${editPrice.text}', 'stock_quantity': '${editStockQuantity.text}'};

  //var productEditResponse= await httpJannatul.put(url3,headers: authorizationHeaderEditProduct,body:jsonEncode(editProduct3 ));
  var productEditResponse= await httpJannatul.put(url2,headers: authorizationHeaderEditProduct,body:editProduct1 );
  print("productEditResponse.statusCode   ${productEditResponse.statusCode}");
  print("productEditResponse.body   ${productEditResponse.body}");
  //   if(productEditResponse.statusCode==200){
  //     print('====================> editProduct1  successful');
  //   } else {
  //     print('====================> editProduct1  Failed');
  //   }
//var productEditResponseMultiPart=
//    final  request = httpJannatul.MultipartRequest('PUT', url3)
//      ..fields['Authorization'] = authorizationToken
//      ..fields['Name'] = 'Nokia A02 Updated600'
//      ..fields['price'] = '66666';
//
//    final response = await request.send();
//    final responseBody = await response.stream.bytesToString();
//    print('RESPONSE BODY:   $responseBody');
  if(productEditResponse.statusCode ==200){
    print('====================> editProduct multipart  successful');
  } else {
    print('====================> editProduct multipart  Failed');
  }
}

deleteMyProduct(Product product) async {
  //   =========DELETE PRODUCT
  Map <String, String>authorizationHeaderEditProduct= { 'Authorization':'Bearer ${logInController.accessToken.value}'};
  final url4 = Uri.parse("https://demo.alorferi.com/api/my-products/${product.id}"); // symphony deleted
   var productDeleteResponse= await httpJannatul.delete(url4,headers: authorizationHeaderEditProduct);
  print("productDeleteResponse.statusCode   ${productDeleteResponse.statusCode}");

  if(productDeleteResponse.statusCode ==200){
    print('====================> product  Delete successful');
    Get.snackbar('Delete', 'Product  Delete successful');
  } else {
    print('====================> product Delete  Failed');
  }
}

createMyProduct() async {
  //CREATE NEW PRODUCT
  //final url2 = Uri.parse("https://demo.alorferi.com/api/my-products/18");
  final url2 = Uri.parse("https://demo.alorferi.com/api/my-products");
  // Get.to(()=>EditMyProductPage(editableProduct));
  //  Map <String, String>authorizationHeaderEditProduct= {'Content-Type':'multipart/form-data', 'Authorization':authorizationToken};
  Map <String, String>authorizationHeaderEditProduct= { 'Authorization':'Bearer ${logInController.accessToken.value}'};
 // Map editProduct1={'id': '${createNewProductId.text}', 'name': '${editProductName.text}','price': '${editPrice.text}', 'stock_quantity': '${editStockQuantity.text}'};
  Map editProduct1={'name': '${editProductName.text}','price': '${editPrice.text}', 'stock_quantity': '${editStockQuantity.text}'};
  //var productEditResponse= await httpJannatul.put(url3,headers: authorizationHeaderEditProduct,body:jsonEncode(editProduct3 ));
  var productCreateResponse= await httpJannatul.post(url2,headers: authorizationHeaderEditProduct,body:editProduct1 );
  print("productCreateResponse.statusCode   ${productCreateResponse.statusCode}");
  print("productCreateResponse.body   ${productCreateResponse.body}");
  //   if(productEditResponse.statusCode==200){
  //     print('====================> editProduct1  successful');
  //   } else {
  //     print('====================> editProduct1  Failed');
  //   }
//var productEditResponseMultiPart=
//    final  request = httpJannatul.MultipartRequest('PUT', url3)
//      ..fields['Authorization'] = authorizationToken
//      ..fields['Name'] = 'Nokia A02 Updated600'
//      ..fields['price'] = '66666';
//
//    final response = await request.send();
//    final responseBody = await response.stream.bytesToString();
//    print('RESPONSE BODY:   $responseBody');
  if(productCreateResponse.statusCode ==200){
    print('====================> productCreateResponse  successful');
  } else {
    print('====================> productCreateResponse multipart  Failed');
  }
}

}