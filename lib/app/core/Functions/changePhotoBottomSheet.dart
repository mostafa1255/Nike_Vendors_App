import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import '../../views/widgets/VsizedBox.dart';
import '../../views/widgets/customMainButton.dart';
import '../styles/App_Colors.dart';

PersistentBottomSheetController<dynamic> changePhotoBottomSheet(
    {required BuildContext context,
    void Function()? onPressed1,
    void Function()? onPressed2,
    void Function()? onPressed3}) {
  return showBottomSheet(
    backgroundColor: AppColors.kOfWhiteColor,
    context: context,
    builder: (context) {
      return SizedBox(
        height: 200.h,
        width: 375.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: onPressed1,
                    icon: Icon(
                      Icons.cancel,
                      size: 25.sp,
                      color: AppColors.kPrimaryColor,
                    )),
              ),
            ),
            CustomMainButton(
              onPressed: onPressed2,
              fcolorWhite: true,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Take Photo",
            ),
            const VsizedBox(height: 10),
            CustomMainButton(
              onPressed: onPressed3,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Choose Photo",
              fcolorWhite: true,
            )
          ],
        ),
      );
    },
  );
}
