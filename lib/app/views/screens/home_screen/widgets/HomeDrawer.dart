import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/VsizedBox.dart';
import 'CustomRowDrawer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260.w,
      backgroundColor: AppColors.kSecondaryColor,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 75.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45.r,
            ),
            const VsizedBox(height: 20),
            Text(
              "Mostafa Yasser",
              style: Txtstyle.style20(context: context),
            ),
            const VsizedBox(height: 45),
            CustomRowDrawer(
              widget: Icon(
                FontAwesomeIcons.user,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Profile",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Icon(
                FontAwesomeIcons.edit,
                color: Colors.white,
                size: 20.sp,
              ),
              text: "Personal Info",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Icon(
                FontAwesomeIcons.add,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Add Product",
            ),
            const VsizedBox(height: 35),
            Divider(
              color: Colors.white,
              thickness: 1.4.w,
              endIndent: 20.w,
              indent: 0,
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Image.asset(
                AppImages.iconsIconSignOut,
                color: Colors.white,
              ),
              text: "Sign Out",
            ),
          ],
        ),
      ),
    );
  }
}
