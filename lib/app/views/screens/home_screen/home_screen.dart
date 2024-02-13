import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'package:nike_app_vendors/app/data/repos/product_Repo/product_repo_Impl.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import 'package:nike_app_vendors/app/views/screens/Add_Product_Screen/add_Product_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/home_screen/widgets/homeAppBar.dart';
import 'package:nike_app_vendors/app/views/screens/my_Profile_Screen/my_profile_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/reviews/reviews_Screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/tools/reg_imp.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                drawer: const HomeDrawer(),
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
