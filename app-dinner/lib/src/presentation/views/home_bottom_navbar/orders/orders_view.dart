import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Order"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('order 1'),
            onTap: () {
              AutoRouter.of(context).push(const OrderDetailView());
            },
          ),
          ListTile(
            title: const Text('order 2'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('order 3'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('order 4'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
