import 'package:auto_size_text/auto_size_text.dart';
import 'package:nike_app_vendors/app/core/functions/isEnglish.dart';
import 'package:nike_app_vendors/app/core/functions/translate_Numbers.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/vendor_cubit/vendor_cubit.dart';

class AvailableBalanceBlocBuilder extends StatelessWidget {
  const AvailableBalanceBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is VendorInfoSuccsess) {
          return AutoSizeText(
            "\$${isEnglish() ? state.vendorModel.totalPrice : translateNumbersToArabic(number: state.vendorModel.totalPrice!)}",
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            minFontSize: 10,
          );
        } else if (state is VendorInfoFaliure) {
          return AutoSizeText(
            state.errMessage,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            minFontSize: 10,
          );
        } else {
          return AutoSizeText(
            "\$${S.of(context).loading}...",
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            minFontSize: 10,
          );
        }
      },
    );
  }
}
