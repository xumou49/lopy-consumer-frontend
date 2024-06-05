import 'package:Lopy/src/presentation/cubits/restaurant_info/restaurant_info_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/image_widget.dart';
import 'package:Lopy/src/utils/providers/storage_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routers/app_router.gr.dart';
import '../../../domain/models/cart.dart';
import '../../../domain/models/restaurant.dart';
import '../../cubits/cart/cart_list_cubit.dart';
import '../common/text_widget.dart';

enum RestaurantCardType { small, big }

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final RestaurantCardType restaurantCardType;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
    required this.restaurantCardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (restaurantCardType) {
      case RestaurantCardType.small:
        return buildSmallCard(context, restaurant);
      case RestaurantCardType.big:
        return buildBigCard(context, restaurant);
      default:
        return Container();
    }
  }

  Widget buildSmallCard(BuildContext context, Restaurant restaurant) {
    final localACartCubit = BlocProvider.of<CartListCubit>(context);

    return SizedBox(
      width: 180,
      height: 134,
      child: Card(
        color: Colors.white,
        margin:
            const EdgeInsets.only(top: 3.0, left: 0, right: 15.0, bottom: 3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  context.router
                      .push(RestaurantDetailView(restaurantId: restaurant.id!));
                },
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero),
                    child: ImageWidget(imageUrl: restaurant.imageUrl)),
              ),
            ),
            Padding(
              // padding: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                        text: restaurant.name,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        textOverflow: TextOverflow.ellipsis,
                      )),
                      ValueListenableBuilder<List<int>>(
                        valueListenable: storageNotifier,
                        builder: (context, value, child) {
                          final isFavorite = value.contains(restaurant.id);
                          return IconButton(
                              onPressed: () async {
                                storageNotifier
                                    .toggleFavRestaurant(restaurant.id!);
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.pink.shade300,
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBigCard(BuildContext context, Restaurant restaurant) {
    final localACartCubit = BlocProvider.of<CartListCubit>(context);
    return SizedBox(
      width: 360,
      height: 200,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  context.router
                      .push(RestaurantDetailView(restaurantId: restaurant.id!));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageUrl: restaurant.imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              color: Colors.grey.shade300,
                              value: downloadProgress.progress)),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextWidget(
                        text: restaurant.name,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      TextWidget(
                        text: restaurant.labels!,
                      ),
                      // Row(
                      //   children: [
                      //     const Icon(Icons.star,
                      //         color: Colors.amber, size: 14.5),
                      //     Text(restaurant.rating,
                      //         style: const TextStyle(fontSize: 12))
                      //   ],
                      // ),
                    ],
                  ),
                  // Use spacer to push the heart icon to the end of the row
                  ValueListenableBuilder<List<int>>(
                    valueListenable: storageNotifier,
                    builder: (context, value, child) {
                      final isFavorite = value.contains(restaurant.id);
                      return IconButton(
                          onPressed: () async {
                            storageNotifier.toggleFavRestaurant(restaurant.id!);
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.pink.shade300,
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Cart buildCart() {
    Cart c = const Cart(
        name: "hello",
        price: 10,
        quantity: 1,
        userId: 100,
        restaurantId: 101,
        restaurantMenuItemId: 102);
    return c;
  }
}

// 'https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb='
