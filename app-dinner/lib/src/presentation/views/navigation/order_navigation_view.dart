import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderNavigationView extends StatelessWidget {
  const OrderNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

