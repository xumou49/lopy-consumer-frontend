import 'package:Lopy/src/presentation/widgets/discover/favourite_header_widget.dart';
import 'package:Lopy/src/presentation/widgets/discover/promotion_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/routers/app_router.gr.dart';
import '../../../widgets/common/appbar_widget.dart';
import '../../../widgets/common/placeholder_widget.dart';
import '../../../widgets/discover/favourite_widget.dart';
import '../../../widgets/discover/promotion_header_widget.dart';
import '../../../widgets/discover/restaurants_header_widget.dart';
import '../../../widgets/discover/restaurants_widget.dart';

@RoutePage()
class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(),

      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const <Widget>[
          PromotionHeaderWidget(),
          PlaceholderWidget(height: 10,),
          PromotionWidget(),
          PlaceholderWidget(height: 20,),
          FavouriteHeaderWidget(),
          PlaceholderWidget(height: 10,),
          FavouriteGridWidget(),
          PlaceholderWidget(height: 20,),
          RestaurantsHeaderWidget(),
          PlaceholderWidget(height: 10,),
          RestaurantsWidget()
        ],
      ),
    );
  }
}

// class DiscoverView extends StatelessWidget {
//   const DiscoverView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
//         title: const Text("Discover"),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20.0),
//         children: [
//           ListTile(
//             title: const Text('Search'),
//             onTap: () {
//               // AutoRouter.of(context).navigate(const SearchView());
//               context.router.push(const SearchNavigationView());
//             },
//           ),
//           ListTile(
//             title: const Text('Promotion view all'),
//             onTap: () {
//               context.router.push(const RestaurantsNavigationView());
//             },
//           ),
//           ListTile(
//             title: const Text('Promotion view one'),
//             onTap: () {
//               context.router.push(const RestaurantsNavigationView(
//                   children: [RestaurantDetailView()]));
//             },
//           ),
//           ListTile(
//             title: const Text('category'),
//             onTap: () {
//               context.router.push(const RestaurantsNavigationView());
//             },
//           ),
//           ListTile(
//             title: const Text('Recommendation'),
//             onTap: () {
//               context.router.push(const RestaurantsNavigationView(
//                   children: [RestaurantDetailView()]));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
