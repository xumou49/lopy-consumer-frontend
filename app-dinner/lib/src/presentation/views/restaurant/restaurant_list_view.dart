import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Restaurants"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('res 1'),
            onTap: () {
              context.router.push(const RestaurantDetailView());
            },
          ),
          ListTile(
            title: const Text('res 2'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('res 3'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('res 4'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
