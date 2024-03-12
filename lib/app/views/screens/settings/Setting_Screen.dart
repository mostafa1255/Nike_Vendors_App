import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/views/widgets/customAppBar.dart';
import '../../../../generated/l10n.dart';
import 'widgets/SettingsScreenBody.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: S.of(context).settings,
        onPressed1: () {
          if (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          }
        },
      ),
      body: const SettingsScreenBody(),
    );
  }
}
