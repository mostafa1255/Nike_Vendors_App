import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/VsizedBox.dart';
import 'StarReviews.dart';

class CustomReviewsContainer extends StatelessWidget {
  const CustomReviewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 27.r,
            backgroundColor: Colors.grey.shade200.withOpacity(0.8),
          ),
          const HsizedBox(width: 15),
          Container(
            width: 270.w,
            decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "12/11/2024",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: "",
                        color: AppColors.kGreyColorB81),
                  ),
                  const VsizedBox(height: 5),
                  const StarReviews(),
                  const VsizedBox(height: 5),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w400,
                        fontFamily: "",
                        color: AppColors.kGreyColorB81),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
