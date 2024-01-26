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

class ImageUploadedLoading extends VendorState {}

class ImageUploadedSuccsess extends VendorState {}

class ImageUploadedFaliure extends VendorState {}
