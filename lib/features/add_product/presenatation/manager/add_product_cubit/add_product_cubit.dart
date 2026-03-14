import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/core/repo/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repo/products_repo/products_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;
  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (failure) => emit(AddProductFailure(failure.message)),
      (imageUrl) async {
        addProductInputEntity.imageURL = imageUrl;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (failure) => emit(AddProductFailure(failure.message)),
          (_) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
