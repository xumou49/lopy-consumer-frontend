import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RestaurantMenuItemView extends StatelessWidget {
  const RestaurantMenuItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Restaurants Menu"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('Menu 1'),
            onTap: () {
              context.router.pop();
            },
          ),

        ],
      ),
    );
  }
}
