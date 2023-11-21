import 'package:Lopy/src/presentation/widgets/discover/restaurant_card_widget.dart';
import 'package:flutter/material.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 134,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // The number of restaurant cards
        itemBuilder: (BuildContext context, int index) {
          return const RestaurantCard(restaurantCardType: RestaurantCardType.small,);
        },
      ),
    );
  }
}
