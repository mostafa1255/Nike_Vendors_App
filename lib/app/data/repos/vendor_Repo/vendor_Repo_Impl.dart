import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';
import 'package:nike_app_vendors/app/core/errors/firebase_faliure.dart';
import 'package:nike_app_vendors/app/core/tools/Location_Services.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo.dart';
import 'package:path/path.dart';
import '../../../core/tools/App_States.dart';
import '../../../core/tools/reg_imp.dart';
import '../../models/Vendors_Model.dart';

class VendroRepoImpl extends VendorRepo {
  File? userImage;
  final database = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<AppState, File>> getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      return right(userImage!);
    } else {
      return left(AppState.notPickedImage);
    }
  }

  @override
  Future<Either<AppState, File>> getImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      userImage = File(pickedImage.path);
      return right(userImage!);
    } else {
      return left(AppState.notPickedImage);
    }
  }

  @override
  Future<Either<Faliures, String>> uploadImageToStorage(
      {required File userImage}) async {
    try {
      debugPrint("File is : $userImage");
      debugPrint("Base name is : ${basename(userImage.path)}");
      Reference imageref =
          FirebaseStorage.instance.ref(basename(userImage.path));

      await imageref.putFile(userImage);
      return right(await imageref.getDownloadURL());
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> sendVendorInfotoFirestore({
    required String userid,
    required String name,
    required String email,
    required double latitude,
    required double longitude,
    required String vendorImageUrl,
    required num number,
  }) async {
    VendorModel usermodel = VendorModel(
        streetName: await LocationServices.getCurrentPositionStreet(
            latitude: latitude, longitude: longitude),
        totalOrders: 0,
        totalPrice: 0,
        vendorImageUrl: vendorImageUrl,
        id: userid,
        name: name,
        email: email,
        latitude: latitude,
        longitude: longitude,
        number: number);
    try {
      return right(await database
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

  @override
  Future<Either<Faliures, VendorModel>> getVendorInfo() async {
    try {
      final vendorSnapshot = await database
          .collection("vendors")
          .where("id", isEqualTo: auth.currentUser!.uid)
          .get();
      VendorModel vendorModel =
          VendorModel.fromMap(map: vendorSnapshot.docs[0].data());
      return right(vendorModel);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> updateVendorImageUrl(
      {required String vendorImageUrl}) async {
    try {
      await database
          .collection("vendors")
          .doc(auth.currentUser!.uid)
          .update({"vendorImageUrl": vendorImageUrl});
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> updateVendorName(
      {required String vendorName}) async {
    try {
      await database
          .collection("vendors")
          .doc(auth.currentUser!.uid)
          .update({"name": vendorName});
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, void>> updateVendorNumber(
      {required String vendorNumber}) async {
    try {
      await database
          .collection("vendors")
          .doc(auth.currentUser!.uid)
          .update({"number": num.parse(vendorNumber)});
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }
}
