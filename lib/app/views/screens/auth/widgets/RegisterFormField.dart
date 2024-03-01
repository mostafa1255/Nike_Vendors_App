import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/App_Regex.dart';
import '../../../../core/tools/global_keys.dart';
import '../../../../data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/SecurePasswordTextField.dart';
import '../../../widgets/VsizedBox.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField({super.key});

  @override
  State<RegisterFormField> createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  @override
  Widget build(BuildContext context) {
    var regCubit = BlocProvider.of<RegisterCubit>(context);

    return Form(
        key: GlobalKeys.riKey2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).your_Name,
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).please_enter_correct_name;
                }
              },
              stringController: regCubit.nameController,
              hinttext: "x x x x x x x ",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            const VsizedBox(height: 8),
            Text(
              S.of(context).email,
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return S.of(context).please_enter_correct_email;
                }
              },
              stringController: regCubit.emailController,
              hinttext: "xyz@gmail.com",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            Text(
              S.of(context).phone_Number,
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 8),
            CustomTextFormField(
              // ignore: body_might_complete_normally_nullable
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.hasNumber(value)) {
                  return S.of(context).please_enter_correct_phone;
                }
              },
              stringController: regCubit.phoneController,
              hinttext: "0124567890",
              securPass: false,
              width: double.infinity,
              height: 80.h,
            ),
            const VsizedBox(height: 8),
            Text(
              S.of(context).password,
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 8),
            SecurePasswordTextField(
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_enter_correct_Password;
                  } else if (!AppRegex.hasUpperCase(value) ||
                      !AppRegex.hasLowerCase(value) ||
                      !AppRegex.hasMinLength(value)) {
                    return S.of(context).password_Condition;
                  }
                },
                passController: regCubit.passController),
          ],
        ));
  }
}
