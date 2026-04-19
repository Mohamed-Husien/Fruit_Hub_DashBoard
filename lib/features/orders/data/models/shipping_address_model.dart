import 'package:fruit_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? phone;
  String? address;
  String? city;
  String? email;

  String? name;
  String? floor;

  ShippingAddressModel(
      {this.name, this.phone, this.address, this.city, this.email, this.floor});

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
        name: json['name'],
        phone: json['phone'],
        address: json['address'],
        city: json['city'],
        email: json['email'],
        floor: json['floor']);
  }
  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'email': email,
      'floor': floor,
    };
  }

  toEntity() {
    return ShippingAddressEntity(
        name: name,
        phone: phone,
        address: address,
        city: city,
        email: email,
        floor: floor);
  }
}
