class Product{
  late String id;
  late String name;
  late num price;
  late num stockQuantity;
  //  late String url;
 final String url;

  // Product({ required this.id,required this.name,required this.price,required this.stockQuantity});
Product({ required this.id,required this.name,required this.price ,required this.stockQuantity,  this.url=''});
}