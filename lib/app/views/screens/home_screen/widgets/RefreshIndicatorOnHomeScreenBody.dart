import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../data/models/Vendors_Model.dart';
import '../../../../router/app_router.dart';
import 'HomeScreenBody.dart';

class RefreshIndicatorOnHomeScreenBody extends StatelessWidget {
  const RefreshIndicatorOnHomeScreenBody({
    super.key,
    required this.vendorModel,
  });
  final VendorModel vendorModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.kPrimaryColor,
      onRefresh: () async {
      
        GoRouter.of(context).pushReplacement(Approuter.bottomnav);
      },
      child: HomeScreenBody(
        vendorModel: vendorModel,
      ),
    );
  }
}
