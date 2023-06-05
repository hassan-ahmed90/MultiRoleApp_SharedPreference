class Cart{
  late final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int? productPrice;
  final int? quantity;
  final String? unitTag;
  final String? image;
Cart({
    required this.productId,
  required this.productPrice,
  required this.productName,
  required this.image,
  required this.id,
  required this.initialPrice,
  required this.quantity,
  required this.unitTag
});

Cart.fromMap(Map<dynamic,dynamic> res)
  : id =res['id'],
   productId =res['productId'],
   productName =res['productName'],
   image =res['image'],
   initialPrice =res['initialPrice'],
   unitTag =res['unitTag'],
   quantity =res['quantity'],
   productPrice =res['productPrice'];
Map<String,Object?> toMap(){
  return{
    'id' : id,
     'productId' : productId,
     'image' : image,
     'productPrice' : productPrice,
      'initialPrice' : initialPrice,
      'unitTag' : unitTag,
      'quantity' : quantity,
    'productName' : productName
  };
}
}
