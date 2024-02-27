import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:nike_app_vendors/app/core/tools/reg_imp.dart';

class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/jsons/Animation - 1708977162147.json"),
      ),
    );
  }
}
