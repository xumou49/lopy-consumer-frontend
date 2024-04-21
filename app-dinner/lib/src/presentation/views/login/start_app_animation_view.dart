import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/routers/app_router.gr.dart';

@RoutePage()
class StartAppAnimationView extends StatefulWidget {
  const StartAppAnimationView({super.key});

  @override
  State<StartAppAnimationView> createState() => _StartAppAnimationViewState();
}

class _StartAppAnimationViewState extends State<StartAppAnimationView> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  _navigateAfterDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      bool isUserLoggedIn = false;
      if (mounted) {
        context.router.replaceAll([
          isUserLoggedIn
              ? const HomeNavigationView()
              : const LoginNavigationView()
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              child: TextWidget(
                  text: "L O P Y",
                  textColor: Color(0xFFF18484),
                  fontSize: 60,
                  fontWeight: FontWeight.w700)),
          // const SizedBox(height: 100),
          // Image.asset(
          //   "lib/src/assets/images/loading.png",
          //   fit: BoxFit.contain,
          // ),
        ],
      ),
    )));
  }
}
