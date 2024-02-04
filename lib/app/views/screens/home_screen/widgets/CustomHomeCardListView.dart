import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../widgets/VsizedBox.dart';

class CustomHomeCardListView extends StatelessWidget {
  const CustomHomeCardListView({
    super.key,
  
  });
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductsSuccsess) {
          return SizedBox(
            width: 375.w,
            height: 180.h,
            child: ListView.builder(
                itemCount: state.products.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: SizedBox(
                      height: 250.h,
                      width: 180.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.r),
                        ),
                        margin: EdgeInsets.zero,
                        elevation: 0.0,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 160.w,
                                  height: 110.h,
                                  child: Image.network(
                                    state.products[index].imageUrl!,
                                    fit: BoxFit.cover,
                                  )),
                              const VsizedBox(height: 5),
                              Flexible(
                                child: Text(
                                  state.products[index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: Txtstyle.style18(context: context)
                                      .copyWith(
                                          fontFamily: Constants.relwayFamily,
                                          color: AppColors.kDeepGreyColorA6A,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                              const VsizedBox(height: 5),
                              Flexible(
                                child: Text(
                                  "\$${state.products[index].price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: Txtstyle.style18(context: context)
                                      .copyWith(
                                          fontFamily: Constants.popinsFamily,
                                          color: AppColors.kFontColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (state is VendorNotHaveProducts) {
          return Center(
            child: Text(
              "You Have No Products",
              style: Txtstyle.style15(context: context)
                  .copyWith(color: AppColors.kFontColor),
            ),
          );
        } else if (state is ProductsFaliure) {
          print(state.errMessage);
          return Center(
            child: Text(
              state.errMessage,
              style: Txtstyle.style15(context: context)
                  .copyWith(color: AppColors.kFontColor),
            ),
          );
        } else if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
