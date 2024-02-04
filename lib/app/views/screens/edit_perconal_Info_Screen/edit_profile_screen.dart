import 'package:flutter/material.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../data/models/Vendors_Model.dart';
import 'widgets/EditProfileScreenBody.dart';
import 'widgets/profileScreenAppBar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
    required this.vendorModel,
  });
  final VendorModel vendorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: profileScreenAppBar(context,),
      body: EditProfileScreenBody(vendorModel: vendorModel),
    );
  }
}
