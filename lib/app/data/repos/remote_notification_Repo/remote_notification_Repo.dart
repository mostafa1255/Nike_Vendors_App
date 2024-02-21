import 'package:dartz/dartz.dart';
import 'package:nike_app_vendors/app/core/errors/faliure.dart';

abstract class RemoteNotificationRepo {
  Future<void> requestNotificationPermission();

  Future<Either<Faliures, void>> sendNotificationToAllUsers();
}
