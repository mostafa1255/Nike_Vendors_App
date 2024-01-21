import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import '../../../../core/styles/App_Colors.dart';

class StarReviews extends StatelessWidget {
  const StarReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: AppColors.kPrimaryColor,
          size: 17.sp,
        ),
        Icon(
          Icons.star,
          color: AppColors.kPrimaryColor,
          size: 17.sp,
        ),
        Icon(
          Icons.star,
          color: AppColors.kPrimaryColor,
          size: 17.sp,
        ),
        Icon(
          Icons.star,
          color: AppColors.kPrimaryColor,
          size: 17.sp,
        ),
        Icon(
          Icons.star_border_outlined,
          color: AppColors.kPrimaryColor,
          size: 17.sp,
        ),
      ],
    );
  }
}
