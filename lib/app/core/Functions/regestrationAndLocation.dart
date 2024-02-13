import 'package:geolocator/geolocator.dart';
import 'package:nike_app_vendors/app/core/functions/determine_Location.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import '../../data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import '../constants.dart';

Future<void> regestrationAndLocation(RegisterCubit regCubit,
    BuildContext context, RegisterCubit cubitRead) async {
  Position? position;
  position = await determinePosition();
  // ignore: use_build_context_synchronously
  await regCubit.signUpwithEmailandPassword(
    context: context,
    latitude: position.latitude.toString(),
    longitude: position.longitude.toString(),
    vendorImageUrl: Constants.vendorImageUrl!,
    phoneNumber: cubitRead.phoneController.text,
    name: cubitRead.nameController.text,
    email: cubitRead.emailController.text,
    password: cubitRead.passController.text,
  );
}
