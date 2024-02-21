import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/core/functions/send_remote_notification.dart';
import 'package:nike_app_vendors/app/core/tools/api_Services.dart';
import 'package:nike_app_vendors/app/views/screens/reviews/widgets/ReviewsScreenBody.dart';
import '../../../core/styles/App_Colors.dart';
import '../../widgets/customAppBar.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: customAppBar(
        context: context,
        title: "Reviews",
        iconData: Icons.add,
        onPressed1: () {},
      ),
      body: ReviewsScreenBody(),
    );
  }
}
