import 'package:nike_app_vendors/app/core/functions/isEnglish.dart';
import 'package:nike_app_vendors/app/core/functions/translate_Numbers.dart';
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
              isEnglish() ? "4.6" : translateNumbersToArabic(number: 4.6),
              style: Txtstyle.style22(context: context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: "",
                  color: AppColors.kPrimaryColor),
            ),
          ],
        ),
        const HsizedBox(width: 20),
        Text(
          S.of(context).total_Reviews(
              isEnglish() ? 30 : translateNumbersToArabic(number: 30)),
          style: Txtstyle.style14(context: context).copyWith(
              fontWeight: FontWeight.w500, color: AppColors.kFontColor),
        ),
      ],
    );
  }
}
