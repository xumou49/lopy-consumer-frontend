import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_list_cubit.dart';
import 'package:Lopy/src/utils/extensions/scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/models/restaurant.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../locator.dart';
import '../../cubits/restaurant_list/restaurant_cuisine_cubit.dart';
import '../../widgets/common/appbar_widget.dart';
import '../../widgets/discover/restaurants_widget.dart';
import '../../widgets/restaurant_widget.dart';

@RoutePage()
class RestaurantListView extends HookWidget {
  final String cuisine;
  const RestaurantListView({Key? key, this.cuisine = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteRestaurantCuisineCubit = BlocProvider.of<RestaurantCuisineCubit>(context);
    final scrollController = useScrollController();
    useEffect(() {
      remoteRestaurantCuisineCubit.getRestaurantList(cuisine: cuisine);
      // scrollController.onScrollEndsListener(() {
      //   remoteRestaurantCuisineCubit.getRestaurantList();
      // });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: const GradientAppBar(title:"Restaurants",),
      body: BlocBuilder<RestaurantCuisineCubit, RestaurantCuisineState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RestaurantCuisineLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case RestaurantCuisineFailed:
              return const Center(
                child: Icon(Icons.refresh),
              );
            case RestaurantCuisineSuccess:
              return RestaurantsWidget(state.restaurants);
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildRestaurantList(
    ScrollController scrollController,
    List<Restaurant> restaurant,
    bool isData,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => RestaurantWidget(restaurant: restaurant[index]),
            childCount: restaurant.length,
          ),
        ),
        if (!isData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}

// @RoutePage()
// class RestaurantListView extends HookWidget {
//   const RestaurantListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final remoteRestaurantCubit = BlocProvider.of<RestaurantListCubit>(context);
//     final scrollController = useScrollController();
//
//     useEffect(() {
//       scrollController.onScrollEndsListener(() {
//         remoteRestaurantCubit.getRestaurantList();
//       });
//       return scrollController.dispose;
//     }, const []);
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
//         title: const Text("Restaurants"),
//       ),
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
//
//   Widget _buildRestaurantList(
//       ScrollController scrollController,
//       List<Restaurant> restaurant,
//       bool isData,
//       ) {
//     return CustomScrollView(
//       controller: scrollController,
//       slivers: [
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//                 (context, index) => RestaurantWidget(restaurant: restaurant[index]),
//             childCount: restaurant.length,
//           ),
//         ),
//         if (!isData)
//           const SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.only(top: 14, bottom: 32),
//               child: CupertinoActivityIndicator(),
//             ),
//           )
//       ],
//     );
//   }
// }
// class RestaurantListView extends StatelessWidget {
//   const RestaurantListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
//         title: const Text("Restaurants"),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20.0),
//         children: [
//           ListTile(
//             title: const Text('res 1'),
//             onTap: () {
//               context.router.push(const RestaurantDetailView());
//             },
//           ),
//           ListTile(
//             title: const Text('res 2'),
//             onTap: () {},
//           ),
//           ListTile(
//             title: const Text('res 3'),
//             onTap: () {},
//           ),
//           ListTile(
//             title: const Text('res 4'),
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
