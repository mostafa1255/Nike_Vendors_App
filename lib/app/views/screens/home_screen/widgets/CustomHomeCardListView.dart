import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/FavoriteIconAction.dart';
import '../../../widgets/VsizedBox.dart';

class CustomHomeCardListView extends StatelessWidget {
  const CustomHomeCardListView({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });
  final String productImage;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 180.h,
      child: ListView.builder(
          itemCount: 5,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: SizedBox(
                height: 250.h,
                width: 180.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.r),
                  ),
                  margin: EdgeInsets.zero,
                  elevation: 0.0,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 160.w,
                            height: 110.h,
                            child: Image.asset(
                              productImage,
                              fit: BoxFit.cover,
                            )),
                        const VsizedBox(height: 5),
                        Flexible(
                          child: Text(
                            productName,
                            overflow: TextOverflow.ellipsis,
                            style: Txtstyle.style18(context: context).copyWith(
                                fontFamily: Constants.relwayFamily,
                                color: AppColors.kDeepGreyColorA6A,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const VsizedBox(height: 5),
                        Flexible(
                          child: Text(
                            "\$$productPrice",
                            overflow: TextOverflow.ellipsis,
                            style: Txtstyle.style18(context: context).copyWith(
                                fontFamily: Constants.popinsFamily,
                                color: AppColors.kFontColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
