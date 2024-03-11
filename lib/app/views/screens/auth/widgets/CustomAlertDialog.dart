import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/VsizedBox.dart';

class CustomForgetPasswordAlertDialog extends StatelessWidget {
  const CustomForgetPasswordAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
      ),
      title: CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColors.kPrimaryColor,
        child: Image.asset(AppImages.iconsEmail1),
      ),
      content: SizedBox(
        height: 88.h,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              S.of(context).check_your_email,
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 10),
            SizedBox(
              width: 230.w,
              child: Text(
                S.of(context).we_have_send_link_to_your_email_to_reset_password,
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context).copyWith(
                    color: AppColors.kGreyColorB81,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constants.popinsFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
