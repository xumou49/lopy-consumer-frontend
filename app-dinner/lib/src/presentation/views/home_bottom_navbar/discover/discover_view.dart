import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/routers/app_router.gr.dart';

@RoutePage()
class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Discover"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('Search'),
            onTap: () {
              // AutoRouter.of(context).navigate(const SearchView());
              context.router.push(const SearchNavigationView());
            },
          ),
          ListTile(
            title: const Text('Promotion view all'),
            onTap: () {
              context.router.push(const RestaurantsNavigationView());
            },
          ),
          ListTile(
            title: const Text('Promotion view one'),
            onTap: () {
              context.router.push(const RestaurantsNavigationView(
                  children: [RestaurantDetailView()]));
            },
          ),
          ListTile(
            title: const Text('category'),
            onTap: () {
              context.router.push(const RestaurantsNavigationView());
            },
          ),
          ListTile(
            title: const Text('Recommendation'),
            onTap: () {
              context.router.push(const RestaurantsNavigationView(
                  children: [RestaurantDetailView()]));
            },
          ),
        ],
      ),
    );
  }
}
