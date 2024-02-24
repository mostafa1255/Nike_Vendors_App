import '../../../../core/tools/reg_imp.dart';

class CustomShadowContainerMyProfileScreen extends StatelessWidget {
  const CustomShadowContainerMyProfileScreen({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 75.h,
      decoration: BoxDecoration(
          color: Colors.grey.shade400.withOpacity(0.25),
          borderRadius: BorderRadius.circular(20.r)),
      child: widget,
    );
  }
}
