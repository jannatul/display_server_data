import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as httpSeller;
import '../models/seller.dart';

class SellerController extends GetxController{
  var sellerList = <Seller>[].obs;

  RxBool productListLoading= true.obs;
  @override
  void onInit() {
    //   print("ProdutListController onInit Starts");
    fetchSellerList();

    super.onInit();
  }

  fetchSellerList() async {
    try {
      final url = Uri.parse("https://demo.alorferi.com/api/users");
      //  var url = Uri.https("${Urls.apiServerBaseUrl}${Endpoints.products}");
      var allSellerListResponse= await httpSeller.get(url);
      if (allSellerListResponse.statusCode == 200) {
        print('DEBUG PRINT===========>allSellerList Fetched===============');
        // print(allProductListResponse.body);
        Map<String, dynamic> dataMap = jsonDecode(allSellerListResponse.body);
        // print(dataMap);
        List<dynamic> dataListOfMap = dataMap['data'];  // = [  { "id": "10",    "name": "Samsung 22 Ultra",    "price": 115000, "stock_quantity": 1}, {}]
        for(var productAsMap in dataListOfMap) {
          //  print(productAsMap );
          sellerList.value.add(Seller(
            //   //productList.add(Product(
              id: productAsMap["id"],
              name: productAsMap['name'],
              url: productAsMap['url']??'/images/blank_profile_picture.png'


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
            //var urlPages= Uri.parse("https://demo.alorferi.com/api/products?page=${i+1}");
            var urlPages= Uri.parse("https://demo.alorferi.com/api/users?page=${i+1}");

            //  print('DEBUG PRINT===========>urlPages:$urlPages=============');
            var allSellerListResponseByPage= await httpSeller.get(urlPages);
            Map<String, dynamic> dataMapPages = jsonDecode(allSellerListResponseByPage.body);
            // print(dataMapPages);
            List<dynamic> dataListOfMapPages = dataMapPages['data'];  // = [  { "id": "10"
            //   print('DEBUG PRINT===========>dataListOfMapPages:=============');

            for(var productAsMap in dataListOfMapPages) {
              //    print(productAsMap );
              sellerList.value.add(Seller(
                //   //    productList.add(Product(
                  id: productAsMap["id"],
                  name: productAsMap['name'],
                  url: productAsMap['url']??'/images/blank_profile_picture.png'
              ));
            } // end of for loop

          }// end of for loop

        } // end of if
        else {}

        print('sellerList.length ${sellerList.length}' );
        //productList.refresh();
      }
      else{
        print('DEBUG PRINT===========>seller List Fetch FAILED=============');
      }



    }
        catch(e,s){
          print("error: $e, stack trace: $s");
        }
  }




}