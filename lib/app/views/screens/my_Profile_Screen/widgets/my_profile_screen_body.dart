import 'package:nike_app_vendors/app/core/styles/App_Colors.dart';
import 'package:nike_app_vendors/app/core/styles/App_Image.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/views/widgets/VsizedBox.dart';
import 'package:nike_app_vendors/app/views/widgets/customMainButton.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import '../../../../router/app_router.dart';
import 'AvailableBalanceBlocBuilder.dart';
import 'CustomListTile.dart';
import 'CustomShadowContainerMyProfileScreen.dart';
import 'MyProfileScreenAppBar.dart';

class MyProfileScreenBody extends StatelessWidget {
  const MyProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lCubit = BlocProvider.of<LoginCubit>(context);
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 375.w,
          height: 305.h,
          decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22.r),
                  bottomRight: Radius.circular(22.r))),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MyProfileScreenAppBar(),
                  const VsizedBox(height: 25),
                  Text(
                    S.of(context).available_Balance,
                    style: Txtstyle.style18(context: context).copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  const AvailableBalanceBlocBuilder(),
                  const VsizedBox(height: 30),
                  CustomMainButton(
                    fontcolor: AppColors.kPrimaryColor,
                    color: Colors.white,
                    txt: S.of(context).withdraw,
                    fcolorWhite: false,
                    width: 140.w,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        const VsizedBox(height: 20),
        Center(
          child: Column(
            children: [
              Container(
                width: 340.w,
                height: 155.h,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomListTile(
                        onTap: () {
                          GoRouter.of(context)
                              .push(Approuter.perconalinfoscreen);
                        },
                        image: AppImages.iconUser,
                        title: S.of(context).personal_Info,
                      ),
                      CustomListTile(
                        onTap: () {
                          GoRouter.of(context)
                              .push(Approuter.perconalinfoscreen);
                        },
                        image: AppImages.iconsIconsettings,
                        title: S.of(context).settings,
                        imageColor: AppColors.kPrimaryColor,
                      )
                    ],
                  ),
                ),
              ),
              const VsizedBox(height: 20),
              CustomShadowContainerMyProfileScreen(
                widget: Center(
                  child: CustomListTile(
                    onTap: () {
                      GoRouter.of(context).push(Approuter.perconalinfoscreen);
                    },
                    image: AppImages.userReview,
                    title: S.of(context).user_Reviews,
                  ),
                ),
              ),
              const VsizedBox(height: 10),
              CustomShadowContainerMyProfileScreen(
                widget: Center(
                  child: CustomListTile(
                    onTap: () async {
                      GoRouter.of(context)
                          .pushReplacement(Approuter.loginescreen);
                      await lCubit.signOut();
                    },
                    image: AppImages.redLogout,
                    title: S.of(context).log_Out,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
