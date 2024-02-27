import 'package:lottie/lottie.dart';
import 'package:nike_app_vendors/app/core/styles/App_Image.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';

class Lottie_Loading_Animation extends StatelessWidget {
  const Lottie_Loading_Animation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppImages.lottieLoadingAnimation),
    );
  }
}
