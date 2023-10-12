import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Cart"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('cart item 1'),
            onTap: () {
              context.router.push(const CartItemView());
            },
          ),
          ListTile(
            title: const Text('place order'),
            onTap: () {
              context.router.push(const PlaceOrderNavigationView());
            },
          ),

        ],
      ),
    );
  }
}
