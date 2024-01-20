import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/views/screens/home_screen/widgets/homeAppBar.dart';

import '../../../core/styles/App_Colors.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
// This code defines a HomeScreen class that extends StatelessWidget. It builds a Scaffold widget with a body of HomeScreenBody widget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      drawer: const HomeDrawer(),
      appBar: homeAppBar(context),
      body: HomeScreenBody(),
    );
  }
}
