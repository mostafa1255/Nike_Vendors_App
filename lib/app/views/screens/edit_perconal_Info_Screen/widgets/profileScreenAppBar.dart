import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/HsizedBox.dart';

PreferredSizeWidget profileScreenAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    leading: CustomBackAndFavIcon(onPressed: () async {
      if (GoRouter.of(context).canPop()) {
        GoRouter.of(context).pop();
      }
      await BlocProvider.of<VendorCubit>(context).getVendorInfo();
    }),
    centerTitle: true,
    title: Text(
      S.of(context).profile,
      style: Txtstyle.style20(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w600,
          fontFamily: Constants.relwayFamily),
    ),
    actions: [
      TextButton(
        onPressed: () {
          if (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
        },
        child: Text(
          S.of(context).cancel,
          style: Txtstyle.style16(context: context).copyWith(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: Constants.relwayFamily),
        ),
      ),
      const HsizedBox(width: 15)
    ],
  );
}
