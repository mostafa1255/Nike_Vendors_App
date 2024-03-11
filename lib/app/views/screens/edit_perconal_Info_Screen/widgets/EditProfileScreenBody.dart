import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'package:nike_app_vendors/app/data/models/Vendors_Model.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/functions/changePhotoBottomSheet.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/VsizedBox.dart';
import '../../../widgets/customMainButton.dart';
import 'Edit_Profile_Bloc_Builder.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody({super.key, required this.vendorModel});
  final VendorModel vendorModel;

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vCubit = BlocProvider.of<VendorCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Edit_Profile_Bloc_Builder(widget: widget),
                const VsizedBox(height: 10),
                Text(
                  widget.vendorModel.name!,
                  style: Txtstyle.style20(context: context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kFontColor,
                      fontFamily: Constants.relwayFamily),
                ),
                TextButton(
                  onPressed: () {
                    changePhotoBottomSheet(
                        context: context,
                        onPressed1: () {
                          GoRouter.of(context).pop();
                        },
                        onPressed2: () {
                          vCubit.getImageFromCameraAndUploadtoStorage();
                        },
                        onPressed3: () {
                          vCubit.getImageFromGalleryAndUploadtoStorage();
                        });
                  },
                  child: Text(
                    S.of(context).change_Profile_Picture,
                    style: Txtstyle.style12(context: context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.kPrimaryColor,
                        fontFamily: Constants.relwayFamily),
                  ),
                )
              ],
            ),
          ),
          const VsizedBox(height: 15),
          Text(
            S.of(context).your_New_Name,
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kGreyColorB81,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: nameController,
            fontcolor: AppColors.kFontColor,
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            S.of(context).your_New_Number,
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kGreyColorB81,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: numberController,
            securPass: false,
            fontcolor: AppColors.kFontColor,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 150),
          CustomMainButton(
            color: AppColors.kPrimaryColor,
            fcolorWhite: true,
            width: 375.w,
            txt: S.of(context).save_Now,
            onPressed: () async {
              if (nameController.text.isNotEmpty &&
                  nameController.text != "" &&
                  numberController.text.isNotEmpty &&
                  numberController.text != "" &&
                  Constants.vendorImageUrl != null &&
                  Constants.vendorImageUrl != "") {
                await vCubit.updateVendorName(vendorName: nameController.text);
                await vCubit.updateVendorNumber(
                    vendorNumber: numberController.text);
                await vCubit.updateVendorImageUrl(
                    vendorImageUrl: Constants.vendorImageUrl!);
                Constants.vendorImageUrl = "";
              } else if (nameController.text.isNotEmpty &&
                  nameController.text != "") {
                await vCubit.updateVendorName(vendorName: nameController.text);
              } else if (numberController.text.isNotEmpty &&
                  numberController.text != "") {
                await vCubit.updateVendorNumber(
                    vendorNumber: numberController.text);
              } else if (Constants.vendorImageUrl != null &&
                  Constants.vendorImageUrl != "") {
                await vCubit.updateVendorImageUrl(
                    vendorImageUrl: Constants.vendorImageUrl!);
                Constants.vendorImageUrl = "";
              }
            },
          ),
        ],
      )),
    ));
  }
}
