import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../repos/register_Repo/register_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.registerrepo,
  ) : super(RegisterInitial());
  final auth = FirebaseAuth.instance;
  Registerrepo registerrepo;
  // ignore: prefer_typing_uninitialized_variables
  var userCredential;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final imageController = TextEditingController();

//Email and Password Auth
  Future<void> signUpwithEmailandPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoading());
    var result = await registerrepo.signUpwithEmailandPassword(
      email: email,
      password: password,
    );
    result.fold((faliure) {
      emit(RegisterFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      userCredential = usercredential;
      emit(RegisterSuccess());
      //   vendorCubit!.sendVendorInfotoFirestore(
      //   name: name, email: email, userid: auth.currentUser!.uid);
    });
  }

//Google Auth
  Future<void> signUpWithGoogle() async {
    emit(RegisterLoading());
    var result = await registerrepo.signUpwithGoogle();
    result.fold((faliure) {
      emit(RegisterFailure(errMessage: faliure.errmessage));
    }, (usercredential) {
      userCredential = usercredential;
      emit(RegisterSuccess());
      //    vendorCubit!.sendVendorInfotoFirestore(
      ///       name: userCredential.user!.displayName!,
      //     email: userCredential.user!.email!,
      //      userid: userCredential.user!.uid);
    });
  }

// Upload User Info
}
