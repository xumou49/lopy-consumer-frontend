import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_list_widget.dart';
import 'package:Lopy/src/presentation/widgets/restaurant_detail/restaurant_details_expanded_appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../domain/models/restaurant.dart';
import '../../cubits/restaurant_info/restaurant_info_cubit.dart';
import '../../widgets/common/appbar_widget.dart';
import '../../widgets/restaurant_detail/menu_item_card_widget.dart';

@RoutePage()
class RestaurantDetailView extends HookWidget with WidgetsBindingObserver {
  final int restaurantId;

  const RestaurantDetailView({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    var data = [
      'One',
    ];
    var top = 0.0;
    var min = 0.0;
    final remoteRestaurantInfoCubit =
        BlocProvider.of<RestaurantInfoCubit>(context);

    useEffect(() {
      print("restaurantId: $restaurantId");
      remoteRestaurantInfoCubit.getRestaurantInfo(restaurantId);
      // return null;
    }, [restaurantId]);

    return Scaffold(
      body: BlocBuilder<RestaurantInfoCubit, RestaurantInfoState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RestaurantInfoLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case RestaurantInfoFailed:
              return const Center(
                child: Icon(Icons.refresh),
              );
            case RestaurantInfoSuccess:
              return _RestaurantDetailListView(restaurant: state.restaurant);
            default:
              return const SizedBox();
          }
        },
      ),
    );

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
                title:
                    // Text("resturant detail", textScaleFactor: 1.0,),
                    AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                        opacity: 1.0,
                        child: (top <= min)
                            ? const GradientAppBar(
                                title: "Restaurant Details",
                              )
                            : const SizedBox(
                                // height: 50,
                                child: Text(
                                  "Restaurant Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              )),
                background: Image.network(
                  'https://img.delicious.com.au/j95dyjBJ/del/2022/10/australian-capital-territory-kingleys-chicken-176385-3.png',
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
                child: const MenuListWidget(),
              );
            },
            childCount: data.length,
          ),
        ),
      ],
    ));

    return CustomScrollView(
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
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                  opacity: 1.0,
                  child: (top <= min)
                      ? const GradientAppBar(
                          title: "Restaurant Details",
                        )
                      : Image.network(
                          "https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb=",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
              );
            })),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                child: const MenuListWidget(),
              );
            },
            childCount: data.length,
          ),
        ),
      ],
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
                title:
                    // Text("resturant detail", textScaleFactor: 1.0,),
                    AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                        opacity: 1.0,
                        child: (top <= min)
                            ? GradientAppBar(
                                title: restaurant.name,
                              )
                            : SizedBox(
                                // height: 50,
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
                  'https://img.delicious.com.au/j95dyjBJ/del/2022/10/australian-capital-territory-kingleys-chicken-176385-3.png',
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
                child: const MenuListWidget(),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    ));
  }
}
