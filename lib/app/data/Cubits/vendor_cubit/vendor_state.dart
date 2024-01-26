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
