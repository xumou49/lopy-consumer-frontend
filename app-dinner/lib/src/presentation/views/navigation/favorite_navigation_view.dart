import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class FavoriteNavigationView extends StatelessWidget {
  const FavoriteNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}