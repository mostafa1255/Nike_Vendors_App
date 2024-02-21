import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nike_app_vendors/app/core/functions/Snack_Bar.dart';
import 'package:nike_app_vendors/app/core/functions/send_remote_notification.dart';
import 'package:nike_app_vendors/app/core/tools/local_notification_services.dart';
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
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';
import 'CustomAuthHaveaccount.dart';
import 'RegisterBlocListener.dart';
import 'RegisterFormField.dart';
import 'VendorImageBlocBuilder.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  RemoteNotificationService remoteNotificationService =
      RemoteNotificationService();
  @override
  void initState() {
    LocalNotificationService.initializeNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubitRead = context.read<RegisterCubit>();
    var regCubit = BlocProvider.of<RegisterCubit>(context);
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
                if (Constants.vendorImageUrl != null) {
                  await regestrationAndLocation(regCubit, context, cubitRead);
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
              GoRouter.of(context).pushReplacement(Approuter.loginescreen);
            },
            accountType: "Already Have Account?",
            createOrLogin: " Log In",
          ),
          const VsizedBox(height: 30),
        ],
      )),
    ));
  }
}
