import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_app_vendors/app/core/tools/Location_Services.dart';
import 'package:nike_app_vendors/app/data/models/Vendors_Model.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/HsizedBox.dart';

PreferredSizeWidget homeAppBar(
    {required BuildContext context,
    required VendorModel vendorModel,
    required String location}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: AppColors.kOfWhiteColor,
    leading: Builder(
      builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Image.asset(AppImages.iconsIconhomeleading)),
    ),
    toolbarHeight: 60.h,
    centerTitle: true,
    title: SizedBox(
        width: 150.w,
        height: 50.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).location,
              style: Txtstyle.style12(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
            ),
            Text(
              location,
              style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.kFontColor),
            ),
          ],
        )),
    actions: [
      CircleAvatar(
        radius: 25.r,
        backgroundColor: AppColors.kPrimaryColor,
        backgroundImage: NetworkImage(vendorModel.vendorImageUrl!),
      ),
      const HsizedBox(width: 10)
    ],
  );
}
