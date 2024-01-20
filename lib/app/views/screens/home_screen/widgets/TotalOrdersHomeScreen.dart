import 'package:auto_size_text/auto_size_text.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';

class TotalOrdersHomeScreen extends StatelessWidget {
  const TotalOrdersHomeScreen({
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
        padding: EdgeInsets.all(13.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              "20",
              style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2,
              minFontSize: 10,
            ),
            Text(
              "TOTAL Orders",
              style: Txtstyle.style14(context: context).copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.kGreyColorB81),
            ),
          ],
        ),
      ),
    );
  }
}
