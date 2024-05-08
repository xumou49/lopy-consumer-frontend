import 'package:Lopy/src/presentation/widgets/discover/favourite_header_widget.dart';
import 'package:Lopy/src/presentation/widgets/discover/promotion_widget.dart';
import 'package:Lopy/src/utils/extensions/scroll_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../domain/models/restaurant.dart';
import '../../../cubits/restaurant_list/restaurant_list_cubit.dart';
import '../../../cubits/restaurant_list/restaurant_promo_cubit.dart';
import '../../../widgets/common/appbar_widget.dart';
import '../../../widgets/common/placeholder_widget.dart';
import '../../../widgets/discover/favourite_widget.dart';
import '../../../widgets/discover/promotion_header_widget.dart';
import '../../../widgets/discover/restaurants_header_widget.dart';
import '../../../widgets/discover/restaurants_widget.dart';

@RoutePage()
class DiscoverView extends HookWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteRestaurantListCubit =
    BlocProvider.of<RestaurantListCubit>(context);
    // final remoteRestaurantPromoCubit =
    // BlocProvider.of<RestaurantPromoCubit>(context);

    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remoteRestaurantListCubit.getRestaurantList();
        // remoteRestaurantPromoCubit.getRestaurantList();
      });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: const GradientAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const PromotionHeaderWidget(),
          const PlaceholderWidget(height: 10),
          BlocBuilder<RestaurantPromoCubit, RestaurantPromoState>(
            builder: (_, restaurantState) {
              switch (restaurantState.runtimeType) {
                case RestaurantPromoLoading:
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                case RestaurantPromoFailed:
                  return const Center(
                    child: Icon(Icons.refresh),
                  );
                case RestaurantPromoSuccess:
                  return PromotionWidget(restaurantState.restaurants);
                default:
                  return const SizedBox();
              }
            },
          ),
          // const PromotionWidget(),
          const PlaceholderWidget(height: 20),
          const FavouriteHeaderWidget(),
          const PlaceholderWidget(height: 10),
          const FavouriteGridWidget(),
          const PlaceholderWidget(height: 20),
          const RestaurantsHeaderWidget(),
          const PlaceholderWidget(height: 10),
          BlocBuilder<RestaurantListCubit, RestaurantListState>(
            builder: (_, restaurantState) {
              switch (restaurantState.runtimeType) {
                case RestaurantListLoading:
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                case RestaurantListFailed:
                  return const Center(
                    child: Icon(Icons.refresh),
                  );
                case RestaurantListSuccess:
                  return RestaurantsWidget(restaurantState.restaurants);
                default:
                  return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildRestaurantList(
    ScrollController scrollController,
    List<Restaurant> restaurants,
    bool isData,
    ) {
  return ListView(
    padding: const EdgeInsets.all(20.0),
    children: <Widget>[
      const PromotionHeaderWidget(),
      const PlaceholderWidget(height: 10),
      // const PromotionWidget(),
      const PlaceholderWidget(height: 20),
      const FavouriteHeaderWidget(),
      const PlaceholderWidget(height: 10),
      const FavouriteGridWidget(),
      const PlaceholderWidget(height: 20),
      const RestaurantsHeaderWidget(),
      const PlaceholderWidget(height: 10),
      RestaurantsWidget(restaurants),
    ],
  );
}

// @RoutePage()
// class DiscoverView extends HookWidget {
//   const DiscoverView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final remoteRestaurantListCubit =
//         BlocProvider.of<RestaurantListCubit>(context);
//     final scrollController = useScrollController();
//
//     useEffect(() {
//       scrollController.onScrollEndsListener(() {
//         remoteRestaurantListCubit.getRestaurantList();
//       });
//       return scrollController.dispose;
//     }, const []);
//
//     return Scaffold(
//       appBar: GradientAppBar(),
//       body: BlocBuilder<RestaurantListCubit, RestaurantListState>(
//         builder: (_, state) {
//           switch (state.runtimeType) {
//             case RestaurantListLoading:
//               return const Center(
//                 child: CupertinoActivityIndicator(),
//               );
//             case RestaurantListFailed:
//               return const Center(
//                 child: Icon(Icons.refresh),
//               );
//             case RestaurantListSuccess:
//               return _buildRestaurantList(
//                 scrollController,
//                 state.restaurants,
//                 state.isData,
//               );
//             default:
//               return const SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }
//
// Widget _buildRestaurantList(
//   ScrollController scrollController,
//   List<Restaurant> restaurants,
//   bool isData,
// ) {
//   return ListView(
//     padding: const EdgeInsets.all(20.0),
//     children: <Widget>[
//       const PromotionHeaderWidget(),
//       const PlaceholderWidget(height: 10),
//       const PromotionWidget(),
//       const PlaceholderWidget(height: 20),
//       const FavouriteHeaderWidget(),
//       const PlaceholderWidget(height: 10),
//       const FavouriteGridWidget(),
//       const PlaceholderWidget(height: 20),
//       const RestaurantsHeaderWidget(),
//       const PlaceholderWidget(height: 10),
//       RestaurantsWidget(restaurants),
//     ],
//   );
// }

// return Scaffold(
// appBar: const GradientAppBar(),
//
// body: ListView(
// padding: const EdgeInsets.all(20.0),
// children: const <Widget>[
// PromotionHeaderWidget(),
// PlaceholderWidget(height: 10,),
// PromotionWidget(),
// PlaceholderWidget(height: 20,),
// FavouriteHeaderWidget(),
// PlaceholderWidget(height: 10,),
// FavouriteGridWidget(),
// PlaceholderWidget(height: 20,),
// RestaurantsHeaderWidget(),
// PlaceholderWidget(height: 10,),
// RestaurantsWidget()
// ],
// ),
// );

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