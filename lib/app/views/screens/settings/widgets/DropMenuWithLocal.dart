import '../../../../../generated/l10n.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/local_language_cubits/local_cubit.dart';
import '../../../../router/app_router.dart';

class DropMenuWithLocal extends StatelessWidget {
  const DropMenuWithLocal({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var localCubit = BlocProvider.of<LocalCubit>(context);
    return DropdownMenu(
        onSelected: (value) {
          if (value == "ar") {
            localCubit.changeLanguage(locale: const Locale("ar"));
            GoRouter.of(context).pushReplacement(Approuter.bottomnav);
          } else {
            localCubit.changeLanguage(locale: const Locale("en"));
            GoRouter.of(context).pushReplacement(Approuter.bottomnav);
          }
        },
        dropdownMenuEntries: [
          DropdownMenuEntry(
            value: "en",
            label: S.of(context).english,
          ),
          DropdownMenuEntry(
            value: "ar",
            label: S.of(context).arabic,
          ),
        ]);
  }
}
