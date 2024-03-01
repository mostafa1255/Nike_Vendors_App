import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';
import 'package:nike_app_vendors/app/views/screens/my_Profile_Screen/widgets/my_profile_screen_body.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: MyProfileScreenBody(),
    );
  }
}
