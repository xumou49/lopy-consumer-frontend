import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
        child: Text('Animation'),
      ),
    );
  }
}
