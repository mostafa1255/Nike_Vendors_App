import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ReviewsListView.dart';

class ReviewsScreenBody extends StatelessWidget {
  const ReviewsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 25.h, left: 14.w, right: 14.w),
      child: const SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewsListView(),
        ],
      )),
    ));
  }
}
