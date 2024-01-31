import '../../../../core/styles/App_Colors.dart';
import '../../../../core/tools/reg_imp.dart';

class CustomCircleAvatarRegisterScreen extends StatelessWidget {
  const CustomCircleAvatarRegisterScreen({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.r,
      backgroundColor: Colors.grey.shade300.withOpacity(0.55),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.camera_alt,
            color: AppColors.kPrimaryColor,
            size: 25.sp,
          )),
    );
  }
}
