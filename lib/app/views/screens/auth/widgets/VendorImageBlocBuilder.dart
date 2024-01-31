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
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is ImageUploadedSuccsess) {
          Constants.imageUrl = state.imageUrl;
          return CircleAvatar(
              radius: 70.r,
              backgroundColor: Colors.grey.shade300.withOpacity(0.55),
              backgroundImage: NetworkImage(state.imageUrl));
        } else if (state is ImageUploadedFaliure) {
          return CustomCircleAvatarRegisterScreen(
            onPressed: () {
              customsnackBar(context, state.errMessage, Colors.red);
              changePhotoBottomSheet(context);
            },
          );
        } else {
          return CustomCircleAvatarRegisterScreen(
            onPressed: () {
              changePhotoBottomSheet(context);
            },
          );
        }
      },
    );
  }
}
