part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

final class ProductInitial extends ProductState {}

class UserInfoUploadedLoading extends ProductState {}

class UserInfoUploadedSuccsess extends ProductState {}

class UserInfoUploadedFaliure extends ProductState {
  final String errMessage;

  UserInfoUploadedFaliure({required this.errMessage});
}

class ImageSelectedSuccsess extends ProductState {}

class ImageSelectedFaliure extends ProductState {
  final String errMessage;

  ImageSelectedFaliure({required this.errMessage});
}

class ImageSelectedLoading extends ProductState {}

class ImageUploadedLoading extends ProductState {}

class ImageUploadedSuccsess extends ProductState {
  final String imageUrl;

  ImageUploadedSuccsess({required this.imageUrl});
}

class ImageUploadedFaliure extends ProductState {
  final String errMessage;

  ImageUploadedFaliure({required this.errMessage});
}

class ProductAddedLoading extends ProductState {}

class ProductAddedSuccsess extends ProductState {}

class ProductAddedFaliure extends ProductState {
  final String errMessage;

  ProductAddedFaliure({required this.errMessage});
}

//
class ProductsLoading extends ProductState {}

class VendorNotHaveProducts extends ProductState {}

class ProductsSuccsess extends ProductState {
  final List<ProductsModel> products;

  ProductsSuccsess({required this.products});
}

class ProductsFaliure extends ProductState {
  final String errMessage;

  ProductsFaliure({required this.errMessage});
}
