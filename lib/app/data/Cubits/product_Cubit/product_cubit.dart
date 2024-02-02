import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repos/vendor_Repo/vendor_Repo.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.vendorRepo) : super(ProductInitial());
  VendorRepo vendorRepo;

  Future<void> getImageFromGalleryAndUploadtoStorage() async {
    emit(ImageSelectedLoading());
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
