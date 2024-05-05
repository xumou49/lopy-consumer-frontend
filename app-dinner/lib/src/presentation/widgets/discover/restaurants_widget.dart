import 'package:flutter/material.dart';
import 'package:Lopy/src/domain/models/restaurant.dart';
import 'package:Lopy/src/presentation/widgets/discover/restaurant_card_widget.dart';

class SlowScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

class RestaurantsWidget extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantsWidget(this.restaurants, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: SlowScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurants.length, // The number of restaurant cards
              itemBuilder: (BuildContext context, int index) {
                return RestaurantCard(
                  restaurant: restaurants[index],
                  restaurantCardType: RestaurantCardType.big,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
