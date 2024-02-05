import 'package:flutter/services.dart';
import 'package:nike_app_vendors/app/core/functions/Snack_Bar.dart';
import 'package:nike_app_vendors/app/core/constants.dart';
import 'package:nike_app_vendors/app/core/styles/App_Colors.dart';
import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import 'package:nike_app_vendors/app/views/widgets/CustomTextFormField.dart';
import 'package:nike_app_vendors/app/views/widgets/VsizedBox.dart';
import 'package:nike_app_vendors/app/views/widgets/customMainButton.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/tools/reg_imp.dart';
import 'AddProductImageBlocBuilder.dart';

class AddProductScreenBody extends StatefulWidget {
  const AddProductScreenBody({super.key});

  @override
  State<AddProductScreenBody> createState() => _AddProductScreenBodyState();
}

class _AddProductScreenBodyState extends State<AddProductScreenBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController brandController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pCubit = BlocProvider.of<ProductCubit>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddProductImageBlocBuilder(pCubit: pCubit),
          const VsizedBox(height: 20),
          Text(
            "Name of Product",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            stringController: nameController,
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Descreption",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            stringController: descriptionController,
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Brand",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            stringController: brandController,
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 20),
          Text(
            "Price",
            style: Txtstyle.style14(context: context).copyWith(
                fontWeight: FontWeight.bold, color: AppColors.kFontColor),
          ),
          const VsizedBox(height: 10),
          CustomTextFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            stringController: priceController,
            securPass: false,
            width: 375.w,
            height: 60.h,
            hinttext: "Air Jordan 1",
          ),
          const VsizedBox(height: 30),
          CustomMainButton(
            color: AppColors.kPrimaryColor,
            txt: "Upload",
            onPressed: () {
              if (Constants.productImageUrl != null &&
                  Constants.productImageUrl != "" &&
                  nameController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty &&
                  brandController.text.isNotEmpty &&
                  priceController.text.isNotEmpty) {
                pCubit.setProducts(
                    productImageUrl: Constants.productImageUrl!,
                    name: nameController.text,
                    descreption: descriptionController.text,
                    brand: brandController.text,
                    price: priceController.text);
                Constants.productImageUrl != "";
              } else {
                customsnackBar(
                    context, " Please fill all the fields ", Colors.redAccent);
              }
            },
            fcolorWhite: true,
            width: 375.w,
          )
        ],
      )),
    ));
  }
}
