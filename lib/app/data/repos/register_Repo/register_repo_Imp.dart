// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/errors/faliure.dart';
import '../../../core/errors/firebase_faliure.dart';
import 'register_repo.dart';

class RegisterRepoImpl extends Registerrepo {
  final auth = FirebaseAuth.instance;
  @override
  Future<Either<Faliures, UserCredential>> signUpwithEmailandPassword({
    required String email,
    required String password,
  }) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (query.docs.length == 0) {
      try {
        print("+++++++++++++++++++++++++++++++++++++++");
        print("in register function");
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user?.uid);
        auth.currentUser!.sendEmailVerification();
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
              "Email already used in USERS Application, Please use another Email."));
    }
  }

  @override
  Future<Either<Faliures, UserCredential>> signUpwithGoogle() async {
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

      if (!isNewUser) {
        return left(FirebaseFailure.fromFirebaseError(
            errorCode: "Email already used, Go to the login page"));
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
}
