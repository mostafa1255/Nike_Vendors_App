
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/global_keys.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/auth cubits/login_Cubit/login_cubit.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';
import 'CustomAuthHaveaccount.dart';
import 'LoginBlocListener.dart';
import 'LoginForm.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var logCubit = context.read<LoginCubit>();
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
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Hello Again!",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              child: Text(
                "Fill your details or continue with social media",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColorB81),
              ),
            ),
          ),
          const VsizedBox(height: 27),
          const VsizedBox(height: 3),
          const LoginForm(),
          const LoginBlocListener(),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
               //   GoRouter.of(context).push(Approuter.forgetpasswordscreen);
                },
                child: Text(
                  "Recovery Password",
                  style: Txtstyle.style12(context: context).copyWith(
                      color: AppColors.kGreyColorB81,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constants.popinsFamily),
                ),
              )),
          const VsizedBox(height: 25),
          CustomMainButton(
            width: 375.w,
            fcolorWhite: true,
            txt: "Sign In",
            color: AppColors.kPrimaryColor,
            onPressed: () {
              if (GlobalKeys.riKey1.currentState!.validate()) {
                BlocProvider.of<LoginCubit>(context).signInwithEmailandPassword(
                  context: context,
                  email: logCubit.emailController.text,
                  password: logCubit.passController.text,
                );
              }
            },
          ),
          const VsizedBox(height: 25),
          CustomMainButton(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.iconGoogle),
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
            onPressed: () {
              logCubit.signInWithGoogle();
            },
          ),
          const VsizedBox(height: 80),
          CustomAuthHaveaccount(
            onTap: () {
            //  GoRouter.of(context).pushReplacement(Approuter.registerscreen);
            },
            accountType: "New User? ",
            createOrLogin: "Create Account",
          )
        ],
      )),
    ));
  }
}
