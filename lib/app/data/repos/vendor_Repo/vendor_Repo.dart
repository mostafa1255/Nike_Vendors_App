import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';
import 'package:nike_app_vendors/app/core/tools/App_States.dart';

abstract class VendorRepo {
  Future<Either<Faliures, void>> sendVendorInfotoFirestore({
    required String name,
    required String email,
    required String userid,
    required String location,
    required num number,
  });
  Future<Either<AppState, File>> getImageFromGallery();
  Future<Either<AppState, File>> getImageFromCamera();
  Future<Either<Faliures, String>> uploadImageToStorage(
      {required File userImage});
}
