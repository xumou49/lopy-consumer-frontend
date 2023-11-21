import 'package:Lopy/src/presentation/widgets/discover/restaurant_card_widget.dart';
import 'package:flutter/material.dart';

class RestaurantsWidget extends StatelessWidget {
  const RestaurantsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10, // The number of restaurant cards
      itemBuilder: (BuildContext context, int index) {
        return const RestaurantCard(
          restaurantCardType: RestaurantCardType.big,
        );
      },
    );
  }
}
