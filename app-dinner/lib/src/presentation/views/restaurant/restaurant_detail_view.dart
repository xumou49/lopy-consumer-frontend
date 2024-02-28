import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../domain/models/restaurant.dart';
import '../../cubits/restaurant_info/restaurant_info_cubit.dart';
import '../../widgets/common/appbar_widget.dart';
import '../../widgets/restaurant_detail/restaurant_info_widget.dart';

@RoutePage()
class RestaurantDetailView extends HookWidget with WidgetsBindingObserver {
  final int restaurantId;

  const RestaurantDetailView({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final remoteRestaurantInfoCubit =
        BlocProvider.of<RestaurantInfoCubit>(context);

    useEffect(() {
      print("restaurantId: $restaurantId");
      remoteRestaurantInfoCubit.getRestaurantInfo(restaurantId);
      // return null;
    }, [restaurantId]);

    if (context.mounted) {
      print("mounted");
    }

    return Scaffold(
      body: BlocBuilder<RestaurantInfoCubit, RestaurantInfoState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RestaurantInfoLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case RestaurantInfoFailed:
              print(state.error);
              return const Center(
                child: Icon(Icons.refresh),
              );
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

  const _RestaurantDetailListView({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    double top = 0.0;
    double min = 0.0;
    // print(restaurant.toString());
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              min = MediaQuery.of(context).padding.top + kToolbarHeight;
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                    opacity: 1.0,
                    child: (top <= min)
                        ? GradientAppBar(
                            title: restaurant.name,
                            subtitle: 'Open until 10pm',
                            actionIcon: Icon(Icons.shopping_cart),
                            showBackButton: true,
                            onBackButtonPressed: () {
                              context.router.pop();
                            },
                          )
                        : SizedBox(
                            child: Text(
                              restaurant.name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          )),
                background: Image.network(
                  // restaurant.imageUrl,
                  "http://api-lopy.wanioco.com/static/restaurant/image.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
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
                                  restaurant.name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              )),
                background: Image.network(
                  // restaurant.imageUrl,
                  "http://api-lopy.wanioco.com/static/restaurant/image.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
                      RestaurantInfoWidget(restaurant: restaurant),
                      const PlaceholderWidget(height: 10),
                      const MenuListWidget(),
                    ],
                  ));
            },
            childCount: 1,
          ),
        ),
      ],
    ));
  }
}
