import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/styles/App_Colors.dart';
import '../../core/styles/text_Style.dart';
import 'CustomBackIcon.dart';

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    void Function()? onPressed1,
    IconData? iconData}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    leading: CustomBackAndFavIcon(
      onPressed: onPressed1,
    ),
    title: Text(
      title,
      style: Txtstyle.style16(context: context).copyWith(
          color: AppColors.kFontColor,
          fontWeight: FontWeight.w500,
          fontFamily: Constants.relwayFamily),
    ),
    centerTitle: true,
  );
}
