import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';

class TotalRevenueHomeScreen extends StatelessWidget {
  const TotalRevenueHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  fontWeight: FontWeight.bold, color: AppColors.kGreyColorB81),
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
    );
  }
}
