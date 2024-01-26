import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import '../../views/widgets/VsizedBox.dart';
import '../../views/widgets/customMainButton.dart';
import '../styles/App_Colors.dart';

PersistentBottomSheetController<dynamic> changePhotoBottomSheet(
    BuildContext context) {
  final repo = VendroRepoImpl();
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
              onPressed: () {},
              fcolorWhite: true,
              width: 200.w,
              color: AppColors.kPrimaryColor,
              txt: "Take Photo",
            ),
            const VsizedBox(height: 10),
            CustomMainButton(
              onPressed: () async {
                print("/" * 30);
             //   await repo.getImageFromGallery();
               // final st = await repo.uploadImageToStorage();
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
