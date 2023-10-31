import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../locator.dart';
import '../../cubits/restaurant_list/restaurant_list_cubit.dart';

@RoutePage()
class RestaurantsNavigationView extends StatelessWidget {
  const RestaurantsNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

// BlocProvider<RestaurantListCubit>(
// create: (context) =>
// RestaurantListCubit(
// locator<ApiRepository>(),
// )
// ..getRestaurantList(),
// child: const AutoRouter(),
// );