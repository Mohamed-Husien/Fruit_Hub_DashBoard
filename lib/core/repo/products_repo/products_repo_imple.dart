import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repo/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImple implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImple({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    try {
      await dataBaseService.addData(
          path: BackendEndpoint.productCollection,
          data: ProductModel.fromEntity(product).toJson());
      return const Right(null);
    } catch (e) {
      log("error in adding product : $e");
      return Left(
        ServerFailure("failed to add product"),
      );
    }
  }
}
