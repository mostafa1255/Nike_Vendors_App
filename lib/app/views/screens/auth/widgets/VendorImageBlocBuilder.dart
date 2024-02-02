import 'package:nike_app_vendors/app/core/styles/App_Colors.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/Functions/changePhotoBottomSheet.dart';
import '../../../../core/constants.dart';
import '../../../../data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'CustomCircleAvatarRegisterScreen.dart';

class VendorImageBlocBuilder extends StatelessWidget {
  const VendorImageBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vCubit = BlocProvider.of<VendorCubit>(context);
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is ImageUploadedSuccsess) {
          Constants.vendorImageUrl = state.imageUrl;
          return CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey.shade300.withOpacity(0.55),
              backgroundImage: NetworkImage(state.imageUrl));
        } else if (state is ImageUploadedLoading) {
          return CircleAvatar(
            radius: 70.r,
            backgroundColor: Colors.grey.shade300.withOpacity(0.55),
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            )),
          );
        } else if (state is ImageUploadedFaliure) {
          return CustomCircleAvatarRegisterScreen(
            onPressed: () {
              customsnackBar(context, state.errMessage, Colors.red);
              changePhotoBottomSheet(
                context: context,
                onPressed1: () => GoRouter.of(context).pop(),
                onPressed2: () async {
                  await vCubit.getImageFromCameraAndUploadtoStorage();
                  GoRouter.of(context).pop();
                },
                onPressed3: () async {
                  await vCubit.getImageFromGalleryAndUploadtoStorage();
                  GoRouter.of(context).pop();
                },
              );
            },
          );
        } else {
          return CustomCircleAvatarRegisterScreen(
            onPressed: () {
              changePhotoBottomSheet(context: context);
              changePhotoBottomSheet(
                context: context,
                onPressed1: () => GoRouter.of(context).pop(),
                onPressed2: () async {
                  await vCubit.getImageFromCameraAndUploadtoStorage();
                  GoRouter.of(context).pop();
                },
                onPressed3: () async {
                  await vCubit.getImageFromGalleryAndUploadtoStorage();
                  GoRouter.of(context).pop();
                },
              );
            },
          );
        }
      },
    );
  }
}
