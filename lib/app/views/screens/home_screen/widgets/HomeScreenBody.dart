import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_app_vendors/app/core/styles/App_Image.dart';
import 'package:nike_app_vendors/app/views/screens/home_screen/widgets/CustomHomeCardListView.dart';
import 'package:nike_app_vendors/app/views/widgets/HsizedBox.dart';
import 'package:nike_app_vendors/app/views/widgets/VsizedBox.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350.w,
            height: 150.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.all(13.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "20",
                    style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    minFontSize: 10,
                  ),
                  Text(
                    "TOTAL Orders",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kGreyColorB81),
                  ),
                ],
              ),
            ),
          ),
          const VsizedBox(height: 20),
          Container(
            width: 350.w,
            height: 150.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TOTAL Revenue",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.kGreyColorB81),
                  ),
                  AutoSizeText(
                    "\$1600",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    minFontSize: 10,
                  ),
                ],
              ),
            ),
          ),
          const VsizedBox(height: 20),
          Container(
            width: 350.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reviews",
                        style: Txtstyle.style14(context: context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kFontColor),
                      ),
                      Text(
                        "See All Reviews",
                        style: Txtstyle.style14(context: context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 27.sp,
                        color: AppColors.kPrimaryColor,
                      ),
                      HsizedBox(width: 5),
                      Text(
                        "4.6",
                        style: Txtstyle.style22(context: context).copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: "",
                            color: AppColors.kPrimaryColor),
                      ),
                      HsizedBox(width: 20),
                      Text(
                        "Total 20 Reviews",
                        style: Txtstyle.style14(context: context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kFontColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const VsizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Product",
                style: Txtstyle.style14(context: context).copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.kFontColor),
              ),
              Text(
                "See All ",
                style: Txtstyle.style14(context: context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kPrimaryColor),
              ),
            ],
          ),
          const VsizedBox(height: 20),
          const CustomHomeCardListView(
              productImage: AppImages.imagesImagenikeshoes3,
              productName: "Nike Air Jurdon",
              productPrice: "50")
        ],
      )),
    ));
  }
}
