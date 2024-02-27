import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../core/tools/save_user_UID.dart';
import '../../../repos/login_Repo/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final auth = FirebaseAuth.instance;
  LoginRepo loginRepo;
  UserCredential? userCredential;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  // final riKey1 = GlobalKey<FormState>();

  Future<void> signInwithEmailandPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoading());
    var result = await loginRepo.signInwithEmailandPassword(
        email: email, password: password, context: context);
    result.fold((faliure) {
      emit(LoginFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      userCredential = usercredential;
      UserUID.saveUID(userCredential!.user!.uid);
      emit(LoginSuccess());
      Future.delayed(const Duration(seconds: 2)).then((_) {
        emailController.clear();
        passController.clear();
      });
    });
  }

//Google Auth
  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    var result = await loginRepo.signInwithGoogle();
    result.fold((faliure) {
      emit(LoginFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      userCredential = usercredential;
      UserUID.saveUID(userCredential!.user!.uid);
      emit(LoginSuccess());
    });
  }

// reset password
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    var result = await loginRepo.resetPassword(email: email);
    result.fold((faliure) {
      emit(ResetPasswordFailure(errMessage: faliure.errmessage));
    }, (voidreturn) {
      emit(ResetPasswordsucsess());
    });
  }

  Future<void> isEmailVerified() async {
    try {
      if (auth.currentUser!.emailVerified) {
        emit(EmailVerificationSuccess());
      } else if (auth.currentUser!.emailVerified == false) {
        emit(EmailVerificationFailure(errMessage: "please verify your email"));
      }
    } on FirebaseAuthException catch (e) {
      emit(EmailVerificationFailure(errMessage: e.message.toString()));
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    UserUID.removeUID();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
  }
}
