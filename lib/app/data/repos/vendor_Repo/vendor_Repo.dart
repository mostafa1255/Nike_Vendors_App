import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';
import 'package:nike_app_vendors/app/core/tools/App_States.dart';
import 'package:nike_app_vendors/app/data/models/Vendors_Model.dart';

abstract class VendorRepo {
  Future<Either<Faliures, void>> updateVendorImageUrl(
      {required String vendorImageUrl});
  Future<Either<Faliures, void>> updateVendorName({required String vendorName});
  Future<Either<Faliures, void>> updateVendorNumber(
      {required String vendorNumber});
  Future<Either<Faliures, VendorModel>> getVendorInfo();

  Future<Either<Faliures, void>> sendVendorInfotoFirestore({
    required String userid,
    required String name,
    required String email,
    required double latitude,
    required double longitude,
    required String vendorImageUrl,
    required num number,
  });
  Future<Either<AppState, File>> getImageFromGallery();
  Future<Either<AppState, File>> getImageFromCamera();
  Future<Either<Faliures, String>> uploadImageToStorage(
      {required File userImage});
}
