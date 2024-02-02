import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/data/Cubits/product_Cubit/product_cubit.dart';
import 'package:nike_app_vendors/app/data/repos/product_Repo/product_repo_Impl.dart';
import 'package:nike_app_vendors/app/data/repos/vendor_Repo/vendor_Repo_Impl.dart';
import 'package:nike_app_vendors/app/views/widgets/customAppBar.dart';
import 'widgets/AddProductScreenBody.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        context: context,
        title: "Add Product",
        iconData: Icons.add,
        onPressed1: () {},
      ),
      body: BlocProvider(
        create: (context) => ProductCubit(VendroRepoImpl(), ProductRepoImpl()),
        child: AddProductScreenBody(),
      ),
    );
  }
}
