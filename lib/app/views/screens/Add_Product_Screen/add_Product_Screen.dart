import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import 'package:nike_app_vendors/app/data/repos/product_Repo/product_repo_Impl.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import 'package:nike_app_vendors/app/views/widgets/customAppBar.dart';
import '../../../../generated/l10n.dart';
import '../../../router/app_router.dart';
import 'widgets/AddProductScreenBody.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        context: context,
        title: S.of(context).add_Product,
        iconData: Icons.add,
        onPressed1: () {
          if (GoRouter.of(context).canPop()) {
            GoRouter.of(context).pop();
          } else {
            GoRouter.of(context).push(Approuter.bottomnav);
          }
        },
      ),
      body: BlocProvider(
        create: (context) => ProductCubit(VendroRepoImpl(), ProductRepoImpl()),
        child: const AddProductScreenBody(),
      ),
    );
  }
}
