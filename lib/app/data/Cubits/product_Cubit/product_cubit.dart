import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_app_vendors/app/data/models/Products_Model.dart';
import 'package:nike_app_vendors/app/data/repos/product_Repo/product_repo.dart';
import '../../repos/vendor_Repo/vendor_Repo.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.vendorRepo, this.productRepo) : super(ProductInitial());
  VendorRepo vendorRepo;
  ProductRepo productRepo;

  Future<void> getVendorProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getVendorProducts();
    result.fold((faliure) {
      emit(ProductsFaliure(errMessage: faliure.errmessage));
    }, (products) {
      if (products == []) {
        return emit(VendorNotHaveProducts());
      }
      emit(ProductsSuccsess(products: products));
    });
  }

  Future<void> setProducts({
    required String productImageUrl,
    required String name,
    required String descreption,
    required String brand,
    required String price,
  }) async {
    emit(ProductAddedLoading());
    var result = await productRepo.setProducts(
        productImageUrl: productImageUrl,
        name: name,
        descreption: descreption,
        brand: brand,
        price: price);
    result.fold((faliure) {
      emit(ProductAddedFaliure(errMessage: faliure.errmessage));
    }, (success) {
      emit(ProductAddedSuccsess());
    });
  }

  Future<void> getImageFromGalleryAndUploadtoStorage() async {
    var result = await vendorRepo.getImageFromGallery();
    result.fold((faliure) {
      emit(ImageSelectedFaliure(errMessage: "Please Select Image"));
    }, (image) async {
      emit(ImageSelectedSuccsess());
      emit(ImageUploadedLoading());
      var result2 = await vendorRepo.uploadImageToStorage(userImage: image);
      result2.fold((faliure) {
        emit(ImageUploadedFaliure(errMessage: faliure.errmessage));
      }, (imageurl) {
        emit(ImageUploadedSuccsess(imageUrl: imageurl));
      });
    });
  }

  Future<void> getImageFromCameraAndUploadtoStorage() async {
    emit(ImageSelectedLoading());
    var result = await vendorRepo.getImageFromCamera();
    result.fold((faliure) {
      emit(ImageSelectedFaliure(errMessage: "Please Select Image"));
    }, (image) async {
      emit(ImageSelectedSuccsess());
      emit(ImageUploadedLoading());
      var result2 = await vendorRepo.uploadImageToStorage(userImage: image);
      result2.fold((faliure) {
        emit(ImageUploadedFaliure(errMessage: faliure.errmessage));
      }, (imageurl) {
        emit(ImageUploadedSuccsess(imageUrl: imageurl));
      });
    });
  }
}
