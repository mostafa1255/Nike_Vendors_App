import 'package:nike_app_vendors/app/core/functions/Snack_Bar.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/global_keys.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';
import 'ForgetPasswordBlocListener.dart';
import 'ForgetPasswordForm.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackAndFavIcon(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Forgot Password",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 8),
          //Bloc Listener
          const ForgetPasswordBlocListener(),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              child: Text(
                "Enter your Email account to reset your password",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColorB81),
              ),
            ),
          ),
          const VsizedBox(height: 27),
          const ForgetPasswordForm(),
          const VsizedBox(height: 40),
          CustomMainButton(
            width: 375.w,
            fcolorWhite: true,
            txt: "Reset password",
            color: AppColors.kPrimaryColor,
            onPressed: () async {
              if (GlobalKeys.riKey3.currentState!.validate()) {
                await BlocProvider.of<LoginCubit>(context).resetPassword(
                    email: BlocProvider.of<LoginCubit>(context)
                        .emailController
                        .text);
              } else {
                customsnackBar(
                    context, " Please Enter Valid Email", Colors.red);
              }
            },
          ),
        ],
      )),
    ));
  }
}
