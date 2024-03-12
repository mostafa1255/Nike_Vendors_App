import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        onPressed1: () {
          if (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
        },
      ),
      body: const ReviewsScreenBody(),
    );
  }
}
