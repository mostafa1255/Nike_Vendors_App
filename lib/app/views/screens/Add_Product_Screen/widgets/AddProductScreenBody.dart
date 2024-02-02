import 'package:nike_app_vendors/app/core/Functions/changePhotoBottomSheet.dart';
import 'package:nike_app_vendors/app/core/styles/App_Colors.dart';
import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import 'package:nike_app_vendors/app/views/screens/auth/register_screen/register_screen.dart';
import 'package:nike_app_vendors/app/views/widgets/CustomTextFormField.dart';
import 'package:nike_app_vendors/app/views/widgets/VsizedBox.dart';
import 'package:nike_app_vendors/app/views/widgets/customMainButton.dart';
import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../auth/widgets/CustomCircleAvatarRegisterScreen.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pCubit = BlocProvider.of<ProductCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProductCubit, ProductState>(
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
          const VsizedBox(height: 20),
          Text(
            "Name of Product",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Descreption",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Brand",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Price",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 30),
          CustomMainButton(
            color: AppColors.kPrimaryColor,
            txt: "Upload",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisterScreen();
              }));
            },
            fcolorWhite: true,
            width: 375.w,
          )
        ],
      )),
    ));
  }
}
