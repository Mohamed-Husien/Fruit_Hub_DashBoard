import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String productCode;
  final String price;
  final String description;
  final File image;
  final bool isFeatured;
  final String? imageURL;

  AddProductInputEntity(
      {required this.name,
      required this.productCode,
      required this.price,
      required this.description,
      required this.image,
      required this.isFeatured,
      this.imageURL});
}
