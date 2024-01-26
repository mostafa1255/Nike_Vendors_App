import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo.dart';

part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  VendorCubit(this.vendorRepo) : super(VendorInitial());
  VendorRepo vendorRepo;

  Future<void> sendVendorInfotoFirestore({
    required String name,
    required String email,
    required String userid,
  }) async {
    emit(UserInfoUploadedLoading());
    var result = await vendorRepo.sendVendorInfotoFirestore(
        number: 01289880177,
        location: '[0.2,5.2]',
        name: name,
        email: email,
        userid: userid);
    result.fold((faliure) {
      emit(UserInfoUploadedFaliure(errMessage: faliure.errmessage));
    }, (usercredential) {
      emit(UserInfoUploadedSuccsess());
    });
  }

  //Future<void> getImageFromGallery() async {
  // emit(ImageSelectedLoading());
  // var result = await vendorRepo.getImageFromGallery();
  // result.fold((faliure) {
  // emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
  //}, (image) {
  // userImage = image;
  //emit(ImageSelectedSuccsess());
  //});
  // }
}
