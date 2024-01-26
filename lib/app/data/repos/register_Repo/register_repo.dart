import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/errors/faliure.dart';

abstract class Registerrepo {
  Future<Either<Faliures, UserCredential>> signUpwithEmailandPassword({
    required String email,
    required String password,
  });
  Future<Either<Faliures, UserCredential>> signUpwithGoogle();
}
