import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo.dart';
part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  VendorCubit(this.vendorRepo) : super(VendorInitial());
  VendorRepo vendorRepo;

  Future<void> sendVendorInfotoFirestore({
    required String userid,
    required String name,
    required String email,
    required double latitude,
    required double longitude,
    required String vendorImageUrl,
    required num number,
    required num totalPrice,
    required int totalOrders,
  }) async {
    emit(UserInfoUploadedLoading());
    var result = await vendorRepo.sendVendorInfotoFirestore(
        number: 01289880177,
        latitude: 15,
        longitude: 10,
        totalOrders: 20,
        totalPrice: 3500,
        vendorImageUrl: "",
        name: name,
        email: email,
        userid: userid);
    result.fold((faliure) {
      emit(UserInfoUploadedFaliure(errMessage: faliure.errmessage));
    }, (usercredential) {
      emit(UserInfoUploadedSuccsess());
    });
  }

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
