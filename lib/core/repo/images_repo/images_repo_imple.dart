import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failures.dart';
import 'package:fruit_hub_dashboard/core/repo/images_repo/images_repo.dart';

class ImagesRepoImple implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage(String imagePath) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
