import 'package:nike_app_vendors/app/core/Functions/Snack_Bar.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/global_keys.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';
import 'CustomAuthHaveaccount.dart';
import 'RegisterBlocListener.dart';
import 'RegisterFormField.dart';
import 'VendorImageBlocBuilder.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitRead = context.read<RegisterCubit>();
    var regCubit = BlocProvider.of<RegisterCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kOfWhiteColor,
            child: IconButton(
              iconSize: 17.sp,
              onPressed: () {
                //       GoRouter.of(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Register Account",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 8),
          const Center(child: VendorImageBlocBuilder()),
          const RegisterFormField(),
          const VsizedBox(height: 27),
          const VsizedBox(height: 15),
          CustomMainButton(
            width: 375.w,
            fcolorWhite: true,
            txt: "Sign Up",
            color: AppColors.kPrimaryColor,
            onPressed: () async {
              if (GlobalKeys.riKey2.currentState!.validate()) {
                if (Constants.imageUrl != null) {
                  print(Constants.imageUrl);
                  await BlocProvider.of<RegisterCubit>(context)
                      .signUpwithEmailandPassword(
                    context: context,
                    latitude: "5",
                    longitude: "120",
                    vendorImageUrl: Constants.imageUrl!,
                    phoneNumber: cubitRead.phoneController.text,
                    name: cubitRead.nameController.text,
                    email: cubitRead.emailController.text,
                    password: cubitRead.passController.text,
                  );
                } else {
                  customsnackBar(
                      context, "Please Upload Your Image", Colors.redAccent);
                }
              }
            },
          ),
          const RegisterBlocListener(),
          const VsizedBox(height: 25),
          CustomMainButton(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.iconsGoogleicon),
                const HsizedBox(width: 15),
                Text(
                  "Sign In with Google ",
                  style: Txtstyle.style14(context: context).copyWith(
                      fontFamily: Constants.relwayFamily,
                      color: AppColors.kFontColor),
                )
              ],
            ),
            fcolorWhite: true,
            color: AppColors.kOfWhiteColor,
            onPressed: () async {
              await regCubit.signUpWithGoogle();
            },
          ),
          const VsizedBox(height: 20),
          CustomAuthHaveaccount(
            onTap: () {
              //  GoRouter.of(context).pushReplacement(Approuter.loginescreen);
            },
            accountType: "Already Have Account?",
            createOrLogin: " Log In",
          ),
        ],
      )),
    ));
  }
}
