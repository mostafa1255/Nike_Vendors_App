import 'package:dartz/dartz.dart';
import 'package:nike_app_vendors/app/core/tools/App_States.dart';
import 'package:nike_app_vendors/app/data/models/Products_Model.dart';
import '../../../core/errors/faliure.dart';

abstract class ProductRepo {
  Future<Either<Faliures, AppState>> setProducts({
    required String productImageUrl,
    required String name,
    required String descreption,
    required String brand,
    required String price,
  });

  Future<Either<Faliures, List<ProductsModel>>> getVendorProducts();
}
