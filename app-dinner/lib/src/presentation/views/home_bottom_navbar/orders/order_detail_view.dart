import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../config/routers/app_router.gr.dart';

@RoutePage()
class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

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
            title: const Text('order 1 details'),
            onTap: () {
              AutoRouter.of(context).push(const RestaurantsNavigationView());
            },
          ),
        ],
      ),
    );
  }
}
