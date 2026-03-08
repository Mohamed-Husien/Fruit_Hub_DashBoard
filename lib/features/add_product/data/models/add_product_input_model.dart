import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String productCode;
  final String price;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageURL;

  AddProductInputModel(
      {required this.name,
      required this.productCode,
      required this.price,
      required this.description,
      required this.image,
      required this.isFeatured,
      this.imageURL});

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      name: entity.name,
      productCode: entity.productCode,
      price: entity.price,
      description: entity.description,
      image: entity.image,
      isFeatured: entity.isFeatured,
      imageURL: entity.imageURL,
    );
  }
  toJson() {
    return {
      "name": name,
      "productCode": productCode,
      "price": price,
      "description": description,
      "isFeatured": isFeatured,
      "imageURL": imageURL
    };
  }
}
