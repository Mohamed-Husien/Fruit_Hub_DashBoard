import 'package:fruit_hub_dashboard/core/repo/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repo/images_repo/images_repo_imple.dart';
import 'package:fruit_hub_dashboard/core/repo/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/core/repo/products_repo/products_repo_imple.dart';
import 'package:fruit_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruit_hub_dashboard/core/services/fire_storage_service.dart';
import 'package:fruit_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerLazySingleton<StorageService>(
    () => FireStorageService(),
  );
  getIt.registerLazySingleton<ImagesRepo>(
    () => ImagesRepoImple(
      getIt<StorageService>(),
    ),
  );
  getIt.registerLazySingleton<DataBaseService>(
    () => FirestoreService(),
  );

  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImple(dataBaseService: getIt<DataBaseService>()),
  );
}
