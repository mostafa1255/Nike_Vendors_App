import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/Functions/changePhotoBottomSheet.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/product_Cubit/product_cubit.dart';
import '../../auth/widgets/CustomCircleAvatarRegisterScreen.dart';

class AddProductImageBlocBuilder extends StatelessWidget {
  const AddProductImageBlocBuilder({
    super.key,
    required this.pCubit,
  });

  final ProductCubit pCubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ImageUploadedSuccsess) {
            Constants.productImageUrl = state.imageUrl;
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
                    await pCubit.getImageFromCameraAndUploadtoStorage();
                    GoRouter.of(context).pop();
                  },
                  onPressed3: () async {
                    await pCubit.getImageFromGalleryAndUploadtoStorage();
                    GoRouter.of(context).pop();
                  },
                );
              },
            );
          } else {
            return CustomCircleAvatarRegisterScreen(
              onPressed: () {
                changePhotoBottomSheet(
                  context: context,
                  onPressed1: () => GoRouter.of(context).pop(),
                  onPressed2: () async {
                    await pCubit.getImageFromCameraAndUploadtoStorage();
                    GoRouter.of(context).pop();
                  },
                  onPressed3: () async {
                    await pCubit.getImageFromGalleryAndUploadtoStorage();
                    GoRouter.of(context).pop();
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
