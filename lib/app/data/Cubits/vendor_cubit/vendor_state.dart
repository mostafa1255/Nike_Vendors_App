part of 'vendor_cubit.dart';

@immutable
sealed class VendorState {}

final class VendorInitial extends VendorState {}

class UserInfoUploadedLoading extends VendorState {}

class UserInfoUploadedSuccsess extends VendorState {}

class UserInfoUploadedFaliure extends VendorState {
  final String errMessage;

  UserInfoUploadedFaliure({required this.errMessage});
}

class ImageSelectedSuccsess extends VendorState {}

class ImageSelectedFaliure extends VendorState {
  final String errMessage;

  ImageSelectedFaliure({required this.errMessage});
}

class ImageSelectedLoading extends VendorState {}

class ImageUploadedLoading extends VendorState {}

class ImageUploadedSuccsess extends VendorState {
  final String imageUrl;

  ImageUploadedSuccsess({required this.imageUrl});
}

class ImageUploadedFaliure extends VendorState {
  final String errMessage;

  ImageUploadedFaliure({required this.errMessage});
}

class VendorInfoLoading extends VendorState {}

class VendorInfoSuccsess extends VendorState {
  final VendorModel vendorModel;

  VendorInfoSuccsess({required this.vendorModel});
}

class VendorInfoFaliure extends VendorState {
  final String errMessage;

  VendorInfoFaliure({required this.errMessage});
}

////////////////
class VendorImageLoading extends VendorState {}

class VendorImageSuccsess extends VendorState {}

class VendorImageFaliure extends VendorState {
  final String errMessage;

  VendorImageFaliure({required this.errMessage});
}

//
class VendorNameLoading extends VendorState {}

class VendorNameSuccsess extends VendorState {}

class VendorNameFaliure extends VendorState {
  final String errMessage;

  VendorNameFaliure({required this.errMessage});
}

//
class VendorNumberLoading extends VendorState {}

class VendorNumberSuccsess extends VendorState {}

class VendorNumberFaliure extends VendorState {
  final String errMessage;

  VendorNumberFaliure({required this.errMessage});
}
