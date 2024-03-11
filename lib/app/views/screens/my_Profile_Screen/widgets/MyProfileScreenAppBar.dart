import '../../../../core/localization/generated/l10n.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../widgets/CustomBackIcon.dart';

class MyProfileScreenAppBar extends StatelessWidget {
  const MyProfileScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackAndFavIcon(
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            }
          },
        ),
        Center(
          widthFactor: 3.w,
          child: Text(
            S.of(context).my_Profile,
            style: Txtstyle.style18(context: context)
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
