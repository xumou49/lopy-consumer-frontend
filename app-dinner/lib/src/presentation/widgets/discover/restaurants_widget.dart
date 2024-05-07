import 'package:flutter/material.dart';
import 'package:Lopy/src/domain/models/restaurant.dart';
import 'package:Lopy/src/presentation/widgets/discover/restaurant_card_widget.dart';

class SlowScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

// class RestaurantsWidget extends StatelessWidget {
//   final List<Restaurant> restaurants;
//
//   const RestaurantsWidget(this.restaurants, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ScrollConfiguration(
//       behavior: SlowScrollBehavior(),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: restaurants.length, // The number of restaurant cards
//               itemBuilder: (BuildContext context, int index) {
//                 return RestaurantCard(
//                   restaurant: restaurants[index],
//                   restaurantCardType: RestaurantCardType.big,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RestaurantsWidget extends StatelessWidget {
  final List<Restaurant> restaurants;
  final bool scrollEnabled;

  const RestaurantsWidget(
      this.restaurants, {
        Key? key,
        this.scrollEnabled = true, // Default value for scrollEnabled
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.builder(
      physics: scrollEnabled ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: restaurants.length, // The number of restaurant cards
      itemBuilder: (BuildContext context, int index) {
        return RestaurantCard(
          restaurant: restaurants[index],
          restaurantCardType: RestaurantCardType.big,
        );
      },
    );

    return scrollEnabled
        ? ScrollConfiguration(
      behavior: SlowScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [listView],
        ),
      ),
    )
        : listView;
  }
}

// class RestaurantsWidget extends StatelessWidget {
//   final List<Restaurant> restaurants;
//
//   const RestaurantsWidget(this.restaurants, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ScrollConfiguration(
//       behavior: SlowScrollBehavior(),
//       child: ListView.builder(
//         physics: const AlwaysScrollableScrollPhysics(), // Allow scrolling
//         itemCount: restaurants.length,
//         itemBuilder: (BuildContext context, int index) {
//           return RestaurantCard(
//             restaurant: restaurants[index],
//             restaurantCardType: RestaurantCardType.big,
//           );
//         },
//       ),
//     );
//   }
// }
