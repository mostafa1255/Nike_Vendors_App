import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/views/screens/Add_Product_Screen/widgets/favoriteScreenAppBar.dart';
import 'widgets/AddProductScreenBody.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: addProductAppBar(
        context: context,
        title: "Add Product",
        iconData: Icons.add,
        onPressed1: () {},
      ),
      body: const AddProductScreenBody(),
    );
  }
}
