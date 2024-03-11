import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'package:nike_app_vendors/app/views/screens/edit_perconal_Info_Screen/edit_profile_screen.dart';
import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../router/app_router.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/VsizedBox.dart';

class PerconalInfoScreenBody extends StatelessWidget {
  const PerconalInfoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(child: BlocBuilder<VendorCubit, VendorState>(
        builder: (context, state) {
          if (state is VendorInfoSuccsess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 65.r,
                      backgroundImage:
                          NetworkImage(state.vendorModel.vendorImageUrl!),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 8.w,
                      child: CircleAvatar(
                        radius: 13.r,
                        backgroundColor: AppColors.kPrimaryColor,
                        child: IconButton(
                            onPressed: () {
                              GoRouter.of(context).push(
                                  Approuter.editprofilescreen,
                                  extra: state.vendorModel);
                            },
                            icon: Icon(
                              FontAwesomeIcons.pen,
                              size: 10.sp,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                )),
                const VsizedBox(height: 60),
                Text(
                  S.of(context).your_Name,
                  style: Txtstyle.style16(context: context).copyWith(
                      color: AppColors.kGreyColorB81,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constants.relwayFamily),
                ),
                const VsizedBox(height: 8),
                CustomTextFormField(
                  enableWriting: false,
                  hinttext: state.vendorModel.name!,
                  fontcolor: AppColors.kFontColor,
                  securPass: false,
                  width: double.infinity,
                  height: 80.h,
                ),
                const VsizedBox(height: 20),
                Text(
                  S.of(context).email,
                  style: Txtstyle.style16(context: context).copyWith(
                      color: AppColors.kGreyColorB81,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constants.relwayFamily),
                ),
                const VsizedBox(height: 8),
                CustomTextFormField(
                  enableWriting: false,
                  hinttext: state.vendorModel.email!,
                  fontcolor: AppColors.kFontColor,
                  securPass: false,
                  width: double.infinity,
                  height: 80.h,
                ),
                const VsizedBox(height: 20),
                Text(
                  S.of(context).phone_Number,
                  style: Txtstyle.style16(context: context).copyWith(
                      color: AppColors.kGreyColorB81,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constants.relwayFamily),
                ),
                const VsizedBox(height: 8),
                CustomTextFormField(
                  enableWriting: false,
                  hinttext: state.vendorModel.number!.toString(),
                  securPass: false,
                  fontcolor: AppColors.kFontColor,
                  width: double.infinity,
                  height: 80.h,
                ),
                const VsizedBox(height: 30),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    ));
  }
}
