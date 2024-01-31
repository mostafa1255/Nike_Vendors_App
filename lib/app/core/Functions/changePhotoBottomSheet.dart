import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import '../../views/widgets/VsizedBox.dart';
import '../../views/widgets/customMainButton.dart';
import '../styles/App_Colors.dart';

PersistentBottomSheetController<dynamic> changePhotoBottomSheet(
    BuildContext context) {
  final vCubit = BlocProvider.of<VendorCubit>(context);
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
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.cancel,
                      size: 25.sp,
                      color: AppColors.kPrimaryColor,
                    )),
              ),
            ),
            CustomMainButton(
              onPressed: () {
                vCubit.getImageFromCameraAndUploadtoStorage();
                GoRouter.of(context).pop();
              },
              fcolorWhite: true,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Take Photo",
            ),
            const VsizedBox(height: 10),
            CustomMainButton(
              onPressed: () async {
                print("/" * 30);
                vCubit.getImageFromGalleryAndUploadtoStorage();
                GoRouter.of(context).pop();
                print("+" * 30);
                //      print(st);
              },
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
