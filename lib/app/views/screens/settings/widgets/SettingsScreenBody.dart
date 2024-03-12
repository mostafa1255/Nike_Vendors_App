import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../../generated/l10n.dart';
import 'DropMenuWithLocal.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 30.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).languages,
                style: Txtstyle.style14(context: context).copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.kFontColor),
              ),
              const DropMenuWithLocal(),
            ],
          )
        ],
      )),
    ));
  }
}
