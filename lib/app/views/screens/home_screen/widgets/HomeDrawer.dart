import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_app_vendors/app/data/Cubits/auth%20cubits/login_Cubit/login_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../core/functions/isEnglish.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../router/app_router.dart';
import '../../../widgets/VsizedBox.dart';
import 'CustomRowDrawer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.vendorImageUrl,
  });
  final String vendorImageUrl;
  @override
  Widget build(BuildContext context) {
    var lCubit = BlocProvider.of<LoginCubit>(context);
    return Drawer(
      width: 260.w,
      backgroundColor: AppColors.kSecondaryColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: isEnglish() ? 25.w : 0.w,
            right: isEnglish() ? 0.w : 25.w,
            top: 75.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(vendorImageUrl),
              radius: 45.r,
            ),
            const VsizedBox(height: 20),
            Text(
              "Mostafa Yasser",
              style: Txtstyle.style20(context: context),
            ),
            const VsizedBox(height: 45),
            CustomElevatedButtonDrawer(
              onTap: () {
                GoRouter.of(context).push(Approuter.myprofilescreen);
              },
              widget: Icon(
                FontAwesomeIcons.user,
                size: 20.sp,
                color: Colors.white,
              ),
              text: S.of(context).profile,
            ),
            const VsizedBox(height: 35),
            CustomElevatedButtonDrawer(
              onTap: () {
                GoRouter.of(context).push(Approuter.perconalinfoscreen);
              },
              widget: Icon(
                FontAwesomeIcons.edit,
                color: Colors.white,
                size: 20.sp,
              ),
              text: S.of(context).personal_Information,
            ),
            const VsizedBox(height: 35),
            CustomElevatedButtonDrawer(
              onTap: () {
                GoRouter.of(context).push(Approuter.addproductscreen);
              },
              widget: Icon(
                FontAwesomeIcons.add,
                size: 20.sp,
                color: Colors.white,
              ),
              text: S.of(context).add_Product,
            ),
            const VsizedBox(height: 35),
            Divider(
              color: Colors.white,
              thickness: 1.4.w,
              endIndent: 20.w,
              indent: 0,
            ),
            const VsizedBox(height: 35),
            CustomElevatedButtonDrawer(
              onTap: () {
                lCubit.signOut();
                GoRouter.of(context).pushReplacement(Approuter.loginescreen);
              },
              widget: Image.asset(
                AppImages.iconsIconSignOut,
                color: Colors.white,
              ),
              text: S.of(context).sign_Out,
            ),
          ],
        ),
      ),
    );
  }
}
