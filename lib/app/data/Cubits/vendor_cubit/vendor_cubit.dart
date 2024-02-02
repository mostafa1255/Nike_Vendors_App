import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_app_vendors/app/data/models/Vendors_Model.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo.dart';
part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  VendorCubit(this.vendorRepo) : super(VendorInitial());
  VendorRepo vendorRepo;

  Future<void> getVendorInfo() async {
    print("in get Vendor Info");
    emit(VendorInfoLoading());
    var result = await vendorRepo.getVendorInfo();
    result.fold((faliure) {
      emit(VendorInfoFaliure(errMessage: faliure.errmessage));
    }, (vendorModel) {
      emit(VendorInfoSuccsess(vendorModel: vendorModel));
    });
  }

  Future<void> sendVendorInfotoFirestore({
    required String userid,
    required String name,
    required String email,
    required double latitude,
    required double longitude,
    required String vendorImageUrl,
    required num number,
  }) async {
    print("in send Vendor Info");
    emit(UserInfoUploadedLoading());
    var result = await vendorRepo.sendVendorInfotoFirestore(
        number: number,
        latitude: latitude,
        longitude: longitude,
        vendorImageUrl: vendorImageUrl,
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
