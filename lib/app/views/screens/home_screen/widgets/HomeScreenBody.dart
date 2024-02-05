import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'package:nike_app_vendors/app/data/models/Vendors_Model.dart';
import 'package:nike_app_vendors/app/views/screens/home_screen/widgets/CustomHomeCardListView.dart';
import 'package:nike_app_vendors/app/views/widgets/VsizedBox.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import 'ReviewsContainerHomeScreen.dart';
import 'TotalOrdersHomeScreen.dart';
import 'TotalRevenueHomeScreen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.vendorModel});
  final VendorModel vendorModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TotalOrdersHomeScreen(
                      totalOrders: vendorModel.totalOrders.toString()),
                  const VsizedBox(height: 20),
                  TotalRevenueHomeScreen(
                      totalRevenue: vendorModel.totalPrice.toString()),
                  const VsizedBox(height: 20),
                  Container(
                    width: 350.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reviews",
                                style: Txtstyle.style14(context: context)
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kFontColor),
                              ),
                              Text(
                                "See All Reviews",
                                style: Txtstyle.style14(context: context)
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kPrimaryColor),
                              ),
                            ],
                          ),
                          const ReviewsContainerHomeScreen()
                        ],
                      ),
                    ),
                  ),
                  const VsizedBox(height: 20),
                  Text(
                    "Your Product",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kFontColor),
                  ),
                  const VsizedBox(height: 20),
                  const CustomHomeCardListView()
                ],
              )),
        ));
      },
    );
  }
}
