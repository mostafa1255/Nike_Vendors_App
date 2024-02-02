import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/App_Colors.dart';
import '../../core/styles/text_Style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hinttext,
    required this.securPass,
    this.stringController,
    required this.width,
    required this.height,
    this.widget,
    this.validator,
    this.fontcolor,
    this.enableWriting,
    this.initialValue,
    this.inputFormatters,
  });
  final bool securPass;
  final TextEditingController? stringController;
  final double width;
  final double height;
  final String? hinttext;
  final Widget? widget;
  final Color? fontcolor;
  final bool? enableWriting;
  final String? initialValue;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        inputFormatters: inputFormatters,
        validator: validator,
        initialValue: initialValue,
        enabled: enableWriting ?? true,
        style: const TextStyle(color: Colors.black),
        controller: stringController,
        obscureText: securPass,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10.r)),
            suffixIcon: widget,
            fillColor: const Color(0xffF7F7F9),
            filled: true,
            hintText: hinttext,
            hintStyle: Txtstyle.style14(
              context: context,
            ).copyWith(color: fontcolor ?? AppColors.kDeepGreyColorA6A),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r))),
      ),
    );
  }
}
