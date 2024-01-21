import 'package:flutter/material.dart';
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
      body: const AddProductScreenBody(),
    );
  }
}
