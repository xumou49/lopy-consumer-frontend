import 'package:Lopy/src/presentation/widgets/discover/restaurant_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/restaurant.dart';

class PromotionWidget extends StatelessWidget {
  final List<Restaurant> restaurants;
  const PromotionWidget(this.restaurants,{super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 134,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length, // The number of restaurant cards
        itemBuilder: (BuildContext context, int index) {
          return RestaurantCard(
            restaurant: restaurants[index],
            restaurantCardType: RestaurantCardType.small,
          );
        },
      ),
    );
  }
}
