// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/faliure.dart';
import '../../../core/errors/firebase_faliure.dart';
import '../../../core/tools/reg_imp.dart';
import '../../auth cubits/login_Cubit/login_cubit.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final auth = FirebaseAuth.instance;

  @override
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print("in Login function");
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential.user?.uid);
      await BlocProvider.of<LoginCubit>(context).isEmailVerified();
      return right(userCredential);
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliures, UserCredential>> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // Check if the user is new
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;

      if (isNewUser) {
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "You are not registered. Go to the register page."));
      } else {
        return right(userCredential);
      }
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }

// reset password
  @override
  Future<Either<Faliures, void>> resetPassword({required String email}) async {
    try {
      if (email != "") {
        return right(await auth.sendPasswordResetEmail(email: email));
      }
      return left(
          FirebaseFailure.fromFirebaseError(errorCode: "Email is empty"));
    } on Exception catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.code));
      } else {
        return left(FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
      }
    }
  }
}
