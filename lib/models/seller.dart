import 'package:flutter/foundation.dart';

class Seller{
  late String id;
  late String name;
  late String url;

  // Product({ required this.id,required this.name,required this.price,required this.stockQuantity});
  Seller({ required this.id,required this.name, this.url=''});
factory Seller.fromJsonData(Map<String,dynamic> jsonData){
  var factoryId = jsonData['id'];
  var factoryName = jsonData['name'];
  var factoryUrl = jsonData['url']??'';

return Seller(id: factoryId, name: factoryName, url: factoryUrl);

}

}