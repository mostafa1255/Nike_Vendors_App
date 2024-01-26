import '../../../../core/tools/App_Regex.dart';
import '../../../../core/tools/global_keys.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import '../../../widgets/CustomTextFormField.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKeys.riKey3,
      child: CustomTextFormField(
        validator: (value) {
          if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
            return "Please enter your correct Email";
          }
        },
        stringController: BlocProvider.of<LoginCubit>(context).emailController,
        hinttext: "XYZ@gmail.com",
        securPass: false,
        width: double.infinity,
        height: 80.h,
      ),
    );
  }
}
