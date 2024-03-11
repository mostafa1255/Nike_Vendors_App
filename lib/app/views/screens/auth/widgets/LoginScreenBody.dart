import 'package:nike_app_vendors/app/core/tools/global_keys.dart';
import 'package:nike_app_vendors/app/views/widgets/Lottie_Loading_Animation.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import '../../../../router/app_router.dart';
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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: loginBlocListener,
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Lottie_Loading_Animation();
        }
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 14.w, right: 14.w),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VsizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).hello_Again,
                  style: Txtstyle.style32(context: context).copyWith(
                      color: AppColors.kFontColor, fontWeight: FontWeight.bold),
                ),
              ),
              const VsizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 260.w,
                  child: Text(
                    S.of(context).fill_your_details_or_continue_with_Google,
                    textAlign: TextAlign.center,
                    style: Txtstyle.style16(context: context)
                        .copyWith(color: AppColors.kGreyColorB81),
                  ),
                ),
              ),
              const VsizedBox(height: 50),
              const VsizedBox(height: 3),
              const LoginForm(),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(Approuter.forgetpasswordscreen);
                    },
                    child: Text(
                      S.of(context).recovery_Password,
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
                txt: S.of(context).sign_In,
                color: AppColors.kPrimaryColor,
                onPressed: () async {
                  if (GlobalKeys.riKey1.currentState!.validate()) {
                    await BlocProvider.of<LoginCubit>(context)
                        .signInwithEmailandPassword(
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
                    Image.asset(AppImages.iconsGoogleicon),
                    const HsizedBox(width: 15),
                    Text(
                      S.of(context).sign_In_with_Google,
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
              const VsizedBox(height: 60),
              CustomAuthHaveaccount(
                onTap: () {
                  GoRouter.of(context)
                      .pushReplacement(Approuter.registerscreen);
                },
                accountType: S.of(context).new_User,
                createOrLogin: S.of(context).create_Account,
              ),
            ],
          )),
        ));
      },
    );
  }
}
