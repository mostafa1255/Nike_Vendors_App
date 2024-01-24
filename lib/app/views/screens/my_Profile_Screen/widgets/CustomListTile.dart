import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';

import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.image,
    this.imageColor,
    this.onTap,
  });
  final String title;
  final String image;
  final Color? imageColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.kGreyColorB81,
              size: 20.sp,
            )),
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22.r,
            child: Image.asset(
              image,
              color: imageColor,
            )),
        title: Text(
          title,
          style: Txtstyle.style15(context: context).copyWith(
              fontWeight: FontWeight.w500, color: AppColors.kFontColor),
        ),
      ),
    );
  }
}
