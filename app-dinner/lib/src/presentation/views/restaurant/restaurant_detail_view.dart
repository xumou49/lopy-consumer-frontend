import 'dart:ui';

import 'package:Lopy/src/presentation/widgets/common/image_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_list_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/models/restaurant.dart';
import '../../cubits/restaurant_info/restaurant_info_cubit.dart';
import '../../widgets/common/appbar_widget.dart';
import '../../widgets/common/empty_result_widget.dart';
import '../../widgets/restaurant_detail/restaurant_info_widget.dart';

@RoutePage()
class RestaurantDetailView extends HookWidget with WidgetsBindingObserver {
  final int restaurantId;

  const RestaurantDetailView({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    context.read<RestaurantInfoCubit>().getRestaurantInfo(restaurantId);
    return Scaffold(
      body: BlocBuilder<RestaurantInfoCubit, RestaurantInfoState>(
        bloc: BlocProvider.of<RestaurantInfoCubit>(context),
        builder: (_, state) {
          switch (state.runtimeType) {
            case RestaurantInfoLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RestaurantInfoFailed:
              return Center(
                  child: EmptyResultWidget(
                      title: "No Results",
                      subtitle:
                          "We cannot find any menu item with given restaurant.\n Try different restaurant."));
            case RestaurantInfoSuccess:
              return _RestaurantDetailListView(restaurant: state.restaurant);
            default:
              return const PlaceholderWidget();
          }
        },
      ),
    );
  }
}

class _RestaurantDetailListView extends StatelessWidget {
  final Restaurant restaurant;

  const _RestaurantDetailListView({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    double top = 0.0;
    double min = 0.0;

    return Scaffold(
        body: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 320.0,
            floating: false,
            pinned: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              min = MediaQuery.of(context).padding.top + kToolbarHeight;
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 100.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4),
                          BlendMode.colorBurn,
                        ),
                        child: ImageWidget(imageUrl: restaurant.imageUrl),
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.1), // Optional: adds a tint
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 32,
                        right: 32,
                        child: TextWidget(
                            text: restaurant.name,
                            textColor: Colors.white,
                            fontSize: 28,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400),
                      ),
                      Positioned(
                        bottom: -100,
                        left: 32,
                        right: 32,
                        child: RestaurantInfoWidget(restaurant: restaurant),
                      ),
                    ],
                  ),
                ),
                title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                    opacity: 1.0,
                    child: (top <= min)
                        ? GradientAppBar(
                            title: restaurant.name,
                            subtitle: 'Open until 10pm',
                            actionIcon: const Icon(Icons.shopping_cart),
                            showBackButton: true,
                            onBackButtonPressed: () {
                              context.router.pop();
                            },
                          )
                        : Container()),
              );
            })),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      const PlaceholderWidget(height: 10),
                      MenuListWidget(
                        menuCategory: restaurant.menuCategory,
                        restaurantId: restaurant.id ?? -1,
                      ),
                    ],
                  ));
            },
            childCount: 1,
          ),
        )
      ],
    ));
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Restaurant restaurant;

  MySliverAppBar({required this.restaurant, required this.expandedHeight});

  double top = 0.0;
  double min = 0.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      flexibleSpace: FlexibleSpaceBar.createSettings(
          maxExtent: maxExtent,
          minExtent: minExtent,
          currentExtent: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            min = MediaQuery.of(context).padding.top + kToolbarHeight;
            top = constraints.biggest.height;
            return FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title:
                  // Text("resturant detail", textScaleFactor: 1.0,),
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                      opacity: 1.0,
                      child: (top <= min)
                          ? GradientAppBar(
                              title: restaurant.name,
                              subtitle: 'Open until 10pm',
                            )
                          : SizedBox(
                              child: Text(
                                restaurant.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            )),
              background: ImageWidget(imageUrl: restaurant.imageUrl),
            );
          })),
    );
  }

  @override
  double get maxExtent => 150.0;

  @override
  double get minExtent => 50;

  double get delta => maxExtent - minExtent;

  double srinkRate(double shrinkOffset) =>
      (shrinkOffset / delta).clamp(0.0, 1.0);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

// @override
// double get maxExtent => expandedHeight;
//
// @override
// double get minExtent => kToolbarHeight;
//
// @override
// bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
