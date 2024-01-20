import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_app_vendors/app/core/styles/App_Colors.dart';
import 'package:nike_app_vendors/app/views/widgets/CustomTextFormField.dart';
import 'package:nike_app_vendors/app/views/widgets/VsizedBox.dart';
import 'package:nike_app_vendors/app/views/widgets/customMainButton.dart';

import '../../../../core/styles/text_Style.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60.r,
              backgroundColor: AppColors.kPrimaryColor,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 25.sp,
                  )),
            ),
          ),
          const VsizedBox(height: 20),
          Text(
            "Name of Product",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Descreption",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Brand",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Price",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 30),
          CustomMainButton(
            color: AppColors.kPrimaryColor,
            txt: "Upload",
            onPressed: () {},
            fcolorWhite: true,
            width: 375.w,
          )
        ],
      )),
    ));
  }
}
