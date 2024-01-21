import 'package:flutter/material.dart';
import 'CustomReviewsContainer.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const CustomReviewsContainer();
      },
    );
  }
}
