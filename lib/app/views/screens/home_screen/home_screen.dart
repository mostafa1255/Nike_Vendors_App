import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'package:nike_app_vendors/app/data/repos/product_Repo/product_repo_Impl.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/tools/reg_imp.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';
import 'widgets/homeAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(VendroRepoImpl(), ProductRepoImpl())
        ..getVendorProducts(),
      child: BlocBuilder<VendorCubit, VendorState>(
        builder: (context, state) {
          if (state is VendorInfoSuccsess) {
            return Scaffold(
                backgroundColor: AppColors.kOfWhiteColor,
                drawer: HomeDrawer(
                    vendorImageUrl: state.vendorModel.vendorImageUrl!),
                appBar: homeAppBar(
                    context: context,
                    vendorImageUrl: state.vendorModel.vendorImageUrl!),
                body: HomeScreenBody(
                  vendorModel: state.vendorModel,
                ));
          } else if (state is VendorInfoFaliure) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
