import 'package:Lopy/src/domain/models/restaurant.dart';
import 'package:Lopy/src/presentation/widgets/discover/restaurant_card_widget.dart';
import 'package:flutter/material.dart';

class RestaurantsWidget extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantsWidget(this.restaurants, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: restaurants.length, // The number of restaurant cards
      itemBuilder: (BuildContext context, int index) {
        return RestaurantCard(
          restaurant: restaurants[index],
          restaurantCardType: RestaurantCardType.big,
        );
      },
    );
  }
}
