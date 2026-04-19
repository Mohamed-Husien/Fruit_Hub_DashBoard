import 'package:fruit_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final int quantity;
  final num price;
  final String code;
  final String imageUrl;

  OrderProductModel(
      {required this.name,
      required this.quantity,
      required this.price,
      required this.code,
      required this.imageUrl});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
        name: json['name'],
        quantity: json['quantity'],
        price: json['price'],
        code: json['code'],
        imageUrl: json['imageUrl']);
  }
  toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'code': code,
      'imageUrl': imageUrl,
    };
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
        name: name,
        quantity: quantity,
        price: price.toDouble(),
        code: code,
        imageUrl: imageUrl);
  }
}
