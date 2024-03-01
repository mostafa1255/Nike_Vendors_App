import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/Snack_Bar.dart';
import '../../../../data/Cubits/auth cubits/register_Cubit/register_cubit.dart';
import '../../../../router/app_router.dart';

void registerBlocListener(context, state) {
  if (state is RegisterSuccess) {
    customsnackBar(context, "Account Created Successfully", Colors.green);
    Future.delayed(const Duration(seconds: 1)).then((_) {
      GoRouter.of(context).pushReplacement(Approuter.loginescreen);
    });
    customsnackBar(context, "Please Verify Your Email", Colors.yellow);
  } else if (state is RegisterFailure) {
    customsnackBar(context, state.errMessage, Colors.red);
  }
}
