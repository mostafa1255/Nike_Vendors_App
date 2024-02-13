import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nike_app_vendors/app/core/functions/save_user_UID.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import '../../../repos/register_Repo/register_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.registerrepo,
  ) : super(RegisterInitial());
  final auth = FirebaseAuth.instance;
  Registerrepo registerrepo;

  var userCredential;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
//Email and Password Auth
  Future<void> signUpwithEmailandPassword(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String latitude,
      required String longitude,
      required String vendorImageUrl,
      required BuildContext context}) async {
    final vBloc = BlocProvider.of<VendorCubit>(context);
    emit(RegisterLoading());
    var result = await registerrepo.signUpwithEmailandPassword(
      email: email,
      password: password,
    );
    result.fold((faliure) {
      emit(RegisterFailure(errMessage: faliure.errmessage));
    }, (usercredential) async {
      userCredential = usercredential;
      UserUID.saveUID(userCredential.user!.uid);
      await vBloc.sendVendorInfotoFirestore(
          name: name,
          email: email,
          userid: auth.currentUser!.uid,
          number: int.parse(phoneNumber),
          latitude: double.parse(latitude),
          longitude: double.parse(longitude),
          vendorImageUrl: vendorImageUrl);
      emit(RegisterSuccess());
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
      UserUID.saveUID(userCredential!.user!.uid);
      emit(RegisterSuccess());
    });
  }
}
