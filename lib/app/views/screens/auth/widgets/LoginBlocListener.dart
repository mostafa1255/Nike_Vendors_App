import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/data/Cubits/vendor_cubit/vendor_cubit.dart';
import '../../../../core/functions/Snack_Bar.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/Cubits/auth cubits/login_Cubit/login_cubit.dart';
import '../../../../router/app_router.dart';

void loginBlocListener(context, state) {
  if (state is LoginSuccess) {
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      await BlocProvider.of<VendorCubit>(context).getVendorInfo();
      GoRouter.of(context).pushReplacement(Approuter.bottomnav);
    });
    customsnackBar(context, "Login Successfully", Colors.green);
  } else if (state is LoginFailure) {
    customsnackBar(context, state.errMessage, Colors.red);
  }
}
