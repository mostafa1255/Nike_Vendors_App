import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';

import '../../../../core/constants.dart';
import '../../../../data/Cubits/vendor_cubit/vendor_cubit.dart';
import 'EditProfileScreenBody.dart';

class Edit_Profile_Bloc_Builder extends StatelessWidget {
  const Edit_Profile_Bloc_Builder({
    super.key,
    required this.widget,
  });

  final EditProfileScreenBody widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is ImageUploadedSuccsess) {
          Constants.vendorImageUrl = state.imageUrl;
          return CircleAvatar(
            radius: 70.r,
            backgroundColor: Colors.grey.shade300.withOpacity(0.45),
            backgroundImage: NetworkImage(state.imageUrl),
          );
        } else {
          return CircleAvatar(
            radius: 70.r,
            backgroundColor: Colors.grey.shade300.withOpacity(0.45),
            backgroundImage: NetworkImage(widget.vendorModel.vendorImageUrl!),
          );
        }
      },
    );
  }
}
