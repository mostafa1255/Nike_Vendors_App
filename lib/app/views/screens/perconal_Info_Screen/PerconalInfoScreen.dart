import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../widgets/CustomBackIcon.dart';
import 'widgets/PerconalInfoScreenBody.dart';

class PerconalInfoScreen extends StatelessWidget {
  const PerconalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOfWhiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.kOfWhiteColor,
        leading: CustomBackAndFavIcon(onPressed: () {}),
        centerTitle: true,
        title: Text(
          "Profile",
          style: Txtstyle.style20(context: context).copyWith(
              color: AppColors.kFontColor,
              fontWeight: FontWeight.w600,
              fontFamily: Constants.relwayFamily),
        ),
      ),
      body: const PerconalInfoScreenBody(),
    );
  }
}
