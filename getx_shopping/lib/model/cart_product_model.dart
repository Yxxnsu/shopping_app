class CartProductModel {
  late String name;
  late String image;
  late String price;
  late int quantity;
  late String productId;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
