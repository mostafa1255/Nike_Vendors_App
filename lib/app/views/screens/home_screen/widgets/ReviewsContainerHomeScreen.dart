import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/HsizedBox.dart';

class ReviewsContainerHomeScreen extends StatelessWidget {
  const ReviewsContainerHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              size: 27.sp,
              color: AppColors.kPrimaryColor,
            ),
            const HsizedBox(width: 5),
            Text(
              "4.6",
              style: Txtstyle.style22(context: context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: "",
                  color: AppColors.kPrimaryColor),
            ),
          ],
        ),
        const HsizedBox(width: 20),
        Text(
          S.of(context).total_Reviews("30"),
          style: Txtstyle.style14(context: context).copyWith(
              fontWeight: FontWeight.w500, color: AppColors.kFontColor),
        ),
      ],
    );
  }
}
