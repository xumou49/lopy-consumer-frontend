import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual favorite restaurants data
    final List<String> favoriteRestaurants = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite list',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: favoriteRestaurants.isEmpty
          ? const Center(
        child: Text('No favorite restaurants'),
      )
          : ListView.builder(
        itemCount: favoriteRestaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteRestaurants[index]),
          );
        },
      ),
    );
  }
}
