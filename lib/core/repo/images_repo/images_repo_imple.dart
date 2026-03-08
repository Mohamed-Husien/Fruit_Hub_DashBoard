import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repo/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImple implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImple(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String imageUrl =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(imageUrl);
    } catch (e) {
      log(e.toString());
      return Left(
        ServerFailure("failed to upload image "),
      );
    }
  }
}
