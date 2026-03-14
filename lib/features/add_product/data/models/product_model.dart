import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String productCode;
  final num price;
  final String description;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageURL;
  final int expirationMonths;
  bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
      required this.productCode,
      required this.price,
      required this.description,
      required this.image,
      required this.isFeatured,
      required this.isOrganic,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.sellingCount = 0,
      this.imageURL,
      required this.code});

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      reviews: entity.reviews
          .map((review) => ReviewModel.fromEntity(review))
          .toList(),
      name: entity.name,
      productCode: entity.productCode,
      price: entity.price,
      description: entity.description,
      image: entity.image,
      isFeatured: entity.isFeatured,
      isOrganic: entity.isOrganic,
      expirationMonths: entity.expirationMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      imageURL: entity.imageURL,
      code: entity.code,
    );
  }
  toJson() {
    return {
      "name": name,
      "code": code,
      "productCode": productCode,
      "price": price,
      "sellingCount": sellingCount,
      "description": description,
      "isFeatured": isFeatured,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "imageURL": imageURL,
      "reviews": reviews.map((review) => review.toJson()).toList(),
    };
  }
}
