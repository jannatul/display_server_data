import 'dart:convert';
import 'package:get/get.dart';
import '../constants/Endpoints.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;
import '../constants/urls.dart';

class ProductController extends GetxController {
 var productList = <Product>[].obs;
 List<Product> cartProductList=[];
 num totalPriceOfCartItem=0;
 // var productList = <Product>[];
  RxBool productListLoading= true.obs;
  @override
  void onInit() {
 //   print("ProdutListController onInit Starts");
   fetchProductList();
   addToCart;
   displayCart();
    super.onInit();
  }

  Future<void> fetchProductList() async {
    try {
      final url = Uri.parse("https://demo.alorferi.com/api/products");
    //  var url = Uri.https("${Urls.apiServerBaseUrl}${Endpoints.products}");
      var allProductListResponse= await http.get(url);
      productListLoading=false.obs;
    //  var response = await http.get(url);
      //final response = await http.get(Uri.parse('https://demo.alorferi.com/api/products'));
    //  var response = await http.get(url,headers:
    //  { "token_type": "Bearer",
    //    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiZjFmOTAzZDI3OGJkZDU2MWUyM2JjMTc4YzdkNTVjOGNiYjY3NDEyYmUwZjM3NDliZmViMzBiYjg3MGI0Njc2NzY4ZGQ3MzUxNGZkNTM2NGIiLCJpYXQiOjE3MDA5MDY4MzUuNjc2OTI1LCJuYmYiOjE3MDA5MDY4MzUuNjc2OTI4LCJleHAiOjE3MzI1MjkyMzUuNjYyMjIxLCJzdWIiOiIwNTE5MDQzZi1iZGNmLTQyYjgtYWIwMC1iOGJhMjIyYTA5Y2QiLCJzY29wZXMiOltdfQ.HsqZw1lKaG7kfoCKNMfdTly48Pz6_sjOCKfjtphqyHgiH57kLSt0uucyGJM6HQ9sAzRSp0-iwZ-Fuyzl9ixsY1TzQjHEugtLXvtYyGfcV8jqtr30VTatclU8Yox0q6yv13mpHbqx0gWYx94oYTVMD-MdBE7Vshn1IkFFJJ-W-F7VvG9E-NaGVZRagNOg-KYAE3-mSe-iZcv7yhsuh4BUzUVFDfsA3AmPcOafg03yBiqw1M2dcncpvZ4Z38WEZWLDQFNj8CWiHufn5IQ1cFkwy57IgjzTUwXb-ph6LwW1VSwVA46Vriif1WMylLL7aMAy4q_L44lmE0SpNuALf772Jdz0veD1sbUcDlWWQLo2fcUTA4UhO6_wOqcqVWqYZXqBPZ5n-r7nqZy_rRRqByq1GQRNDAiggwb00OwQfRTrB25Ytw9kGUoEdFIoraBayYOIIk-j-e0FYwBn8DTOwYWP0wwrir-GCzOIXG1DiEI7oowQ7M7Kx22g0YH-KpaVzL2hmQfv9HrLOr5wKi-vEdELsMbK94_ZoAyPOWkcXjfm2G5n7UjTe8UZhMzulcUdBiRKLRARY868ldjz6kdbrXqGewt_te3j-gR_H8owA2OKo7Qd7js_1NwInx7pfuCeaAtS5zZQhYcnuxeuu4Btla2LOpWhKw-f8G3H1qebfHwAjOc"});


      if (allProductListResponse.statusCode == 200) {
        print('DEBUG PRINT===========>Products List Fetched===============');
       // print(allProductListResponse.body);
        Map<String, dynamic> dataMap = jsonDecode(allProductListResponse.body);
      // print(dataMap);
        List<dynamic> dataListOfMap = dataMap['data'];  // = [  { "id": "10",    "name": "Samsung 22 Ultra",    "price": 115000, "stock_quantity": 1}, {}]
        for(var productAsMap in dataListOfMap) {
        //  print(productAsMap );
             productList.value.add(Product(
               //   //productList.add(Product(
           id: productAsMap["id"],
           name: productAsMap['name'],
           price: productAsMap['price'],
           stockQuantity: productAsMap['stock_quantity'],
           url: productAsMap['url']??'/images/blank_product_picture.png'
          ));
        }

       // print('=========================dataMap[meta]==========PRODUCTS OF PAGES EXCLUDING PAGE 1');
        Map<String,dynamic> dataPagesLoaded =dataMap['meta'];
       // print(dataPagesLoaded);
        int currentPage=dataPagesLoaded['current_page'];
        int firstPage=dataPagesLoaded['from'];
        int lastPage=dataPagesLoaded['last_page'];
     //   print('current_page : ${currentPage}');
      //  print('firstPage : ${firstPage}');
      //  print('last_page : ${lastPage}');

        if(currentPage==firstPage && lastPage>firstPage ){
          for(int i= currentPage;i<=lastPage;i++){
            var urlPages= Uri.parse("https://demo.alorferi.com/api/products?page=${i+1}");
          //  print('DEBUG PRINT===========>urlPages:$urlPages=============');
            var allProductListResponseByPage= await http.get(urlPages);
            Map<String, dynamic> dataMapPages = jsonDecode(allProductListResponseByPage.body);
           // print(dataMapPages);
            List<dynamic> dataListOfMapPages = dataMapPages['data'];  // = [  { "id": "10"
         //   print('DEBUG PRINT===========>dataListOfMapPages:=============');

            for(var productAsMap in dataListOfMapPages) {
          //    print(productAsMap );
              productList.value.add(Product(
     //   //    productList.add(Product(
                  id: productAsMap["id"],
                  name: productAsMap['name'],
                  price: productAsMap['price'],
                  stockQuantity: productAsMap['stock_quantity'],
                  url: productAsMap['url']??'/images/blank_product_picture.png'
              ));
            } // end of for loop

          }// end of for loop

        } // end of if
        else {}

        print('productList.length ${productList.length}' );
        //productList.refresh();
      }
      else{
        print('DEBUG PRINT===========>Products List Fetch FAILED=============');
      }
      print('DEBUG PRINT===========>Products List url =============');
    //  productList.forEach((element) {print(element.url); });

    } catch (e, s) {
      print("error: $e, stack trace: $s");
    }
  }

 void addToCart(Product myCartProduct){
   //  cartProductList.value.add(myCartProduct);
   cartProductList.add(myCartProduct);
   // cartProductList.add(myCartProduct);
   print("==========================${cartProductList.length}====added ===========================");
   for(var v in cartProductList){

     print('single element of cart ${v.name}');
   }

 }

 void displayCart(){
   for (var v in cartProductList){
     print('v.runtimeType ${v.runtimeType}');
     print('v.toString() ${v.toString()}');
   }
 }

void addTotalPriceOfCartItems(){
    for(int i=0;i<cartProductList.length;i++){
      totalPriceOfCartItem= totalPriceOfCartItem + cartProductList[i].price;
    }
}

void removeItemFromCart( Product removableProduct){
    cartProductList.remove(removableProduct);
}


}
