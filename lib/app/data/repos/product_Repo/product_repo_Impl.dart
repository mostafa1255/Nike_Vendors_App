import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';
import 'package:nike_app_vendors/app/core/tools/App_States.dart';
import 'package:nike_app_vendors/app/data/models/Products_Model.dart';
import 'package:nike_app_vendors/app/data/repos/product_Repo/product_repo.dart';
import '../../../core/errors/firebase_faliure.dart';

class ProductRepoImpl extends ProductRepo {
  final auth = FirebaseAuth.instance;
  final dataBase = FirebaseFirestore.instance;
  @override
  Future<Either<Faliures, AppState>> setProducts(
      {required String productImageUrl,
      required String name,
      required String descreption,
      required String brand,
      required String price}) async {
    try {
      final product = dataBase.collection("products").doc();
      ProductsModel productsModel = ProductsModel(
          id: product.id,
          vendorId: auth.currentUser!.uid,
          brand: brand,
          name: name,
          price: price,
          imageUrl: productImageUrl,
          description: descreption);
      await product.set(productsModel.toJson());
      return right(AppState.productAdded);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
    }
  }

  @override
  Future<Either<Faliures, List<ProductsModel>>> getVendorProducts() async {
    try {
      final product = await dataBase
          .collection("products")
          .where("vendorId", isEqualTo: auth.currentUser!.uid)
          .get();
      if (product.docs.isEmpty) {
        return const Right([]);
      }
      List<ProductsModel> productsList = [];
      for (var element in product.docs) {
        productsList.add(ProductsModel.fromJson(map: element.data()));
      }
      return Right(productsList);
    } catch (e) {
      return Left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
    }
  }
}
