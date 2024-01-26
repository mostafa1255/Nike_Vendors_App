import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';
import 'package:nike_app_vendors/app/core/errors/firebase_faliure.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo.dart';
import 'package:path/path.dart';
import '../../../core/tools/App_States.dart';
import '../../../core/tools/reg_imp.dart';
import '../../models/Vendors_Model.dart';

class VendroRepoImpl extends VendorRepo {
  File? userImage;

  @override
  Future<Either<AppState, AppState>> getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      return right(AppState.pickedImage);
    } else {
      return left(AppState.notPickedImage);
    }
  }

  @override
  Future<Either<AppState, AppState>> getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      print("Image is not null");
      print(userImage);
      return right(AppState.pickedImage);
    } else {
      print("Image is null");
      return left(AppState.notPickedImage);
    }
  }

  @override
  Future<Either<Faliures, String>> uploadImageToStorage() async {
    try {
      debugPrint("File is : $userImage");
      debugPrint("Base name is : ${basename(userImage!.path)}");
      Reference imageref =
          FirebaseStorage.instance.ref(basename(userImage!.path));
      print(userImage);
      await imageref.putFile(userImage!);
      return right(await imageref.getDownloadURL());
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> sendVendorInfotoFirestore({
    required String name,
    required String email,
    required String userid,
    required String location,
    required num number,
  }) async {
    VendorModel usermodel = VendorModel(
        id: userid,
        name: name,
        email: email,
        location: "[0.2,5.2]",
        number: number);
    try {
      return right(await FirebaseFirestore.instance
          .collection("vendors")
          .doc(userid)
          .set(usermodel.toMap()));
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }
}
