import 'package:nike_app_vendors/app/core/functions/Snack_Bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/functions/regestrationAndLocation.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/global_keys.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import '../../../../router/app_router.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/Lottie_Loading_Animation.dart';
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: registerBlocListener,
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Lottie_Loading_Animation();
        }
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 14.w, right: 14.w),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).register_Account,
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
                txt: S.of(context).sign_Up,
                color: AppColors.kPrimaryColor,
                onPressed: () async {
                  if (GlobalKeys.riKey2.currentState!.validate()) {
                    if (Constants.vendorImageUrl != null) {
                      await regestrationAndLocation(
                          regCubit, context, cubitRead);
                    } else {
                      customsnackBar(
                          context,
                          S.of(context).please_Upload_Your_Image,
                          Colors.redAccent);
                    }
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
                onPressed: () async {
                  await regCubit.signUpWithGoogle();
                },
              ),
              const VsizedBox(height: 20),
              CustomAuthHaveaccount(
                onTap: () {
                  GoRouter.of(context).pushReplacement(Approuter.loginescreen);
                },
                accountType: S.of(context).already_have_an_account,
                createOrLogin: S.of(context).login,
              ),
              const VsizedBox(height: 30),
            ],
          )),
        ));
      },
    );
  }
}
