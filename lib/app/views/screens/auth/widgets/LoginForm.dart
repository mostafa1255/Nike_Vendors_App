import 'package:nike_app_vendors/app/core/tools/global_keys.dart';
import 'package:nike_app_vendors/app/views/widgets/SecurePasswordTextField.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/App_Regex.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/VsizedBox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    var logCubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: GlobalKeys.riKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).email,
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: logCubit.emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return S.of(context).please_enter_correct_email;
              }
              return null;
            },
            hinttext: "xyz@gmail.com",
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            S.of(context).password,
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          SecurePasswordTextField(
            passController: logCubit.passController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).please_enter_correct_Password;
              }
            },
          )
        ],
      ),
    );
  }
}
