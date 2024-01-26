// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/errors/faliure.dart';
import '../../../core/errors/firebase_faliure.dart';
import '../../../core/tools/reg_imp.dart';
import '../../Cubits/auth cubits/login_Cubit/login_cubit.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final auth = FirebaseAuth.instance;

  @override
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    // ignore: prefer_is_empty
    if (query.docs.length == 0) {
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
          return left(
              FirebaseFailure.fromFirebaseError(errorCode: e.toString()));
        }
      }
    } else {
      return left(FirebaseFailure.fromFirebaseError(
          errorCode:
              "This Email Register in User App, Please Login With Vendor Email"));
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
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Check if the user is new
      final isNewUser = userCredential.additionalUserInfo!.isNewUser;

      QuerySnapshot query = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userCredential.user!.email)
          .get();
      // ignore: prefer_is_empty
      if (query.docs.length == 0) {
        // is OLD User
        if (!isNewUser) {
          return right(userCredential);
        } else {
          //Go to the Register screen
          return left(FirebaseFailure.fromFirebaseError(
              errorCode: "Go to the Register Screen to create an account"));
        }
      } else {
        //Go to the User App
        return left(FirebaseFailure.fromFirebaseError(
            errorCode:
                "  Google This Email Register in User App, Please Login With Vendor Email"));
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
