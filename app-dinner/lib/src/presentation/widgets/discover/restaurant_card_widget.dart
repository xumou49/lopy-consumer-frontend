import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../config/routers/app_router.gr.dart';
import 'package:Lopy/src/presentation/views/cart/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import '../../../domain/models/cart.dart';
import '../../../domain/models/restaurant.dart';
import '../../cubits/cart/cart_list_cubit.dart';

enum RestaurantCardType { small, big }

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;
  final RestaurantCardType restaurantCardType;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
    required this.restaurantCardType,
  }) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      FavoriteManager.toggleFavorite(widget.restaurant);
    });
  }


  @override
  Widget build(BuildContext context) {
    switch (widget.restaurantCardType) {
      case RestaurantCardType.small:
        return buildSmallCard(widget.restaurant);
      case RestaurantCardType.big:
        return buildBigCard(context, widget.restaurant);
      default:
        return Container();
    }
  }

  Widget buildSmallCard(Restaurant restaurant) {
    return SizedBox(
      width: 166,
      height: 134,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  // context.router.push(RestaurantsNavigationView(
                  //     children: [RestaurantDetailView(restaurantId: 2)]));
                },
                child: Image.network(
                  'https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb=',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(restaurant.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12)),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: Colors.amber, size: 12.5),
                      Text(restaurant.rating, style: TextStyle(fontSize: 10)),

                      const Spacer(),
                      // Use spacer to push the heart icon to the end of the row
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.pink.shade300,
                          size: 15,
                        ),
                        onPressed: toggleFavorite,
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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image.network(
                restaurant.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(restaurant.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: Colors.amber, size: 14.5),
                      Text(restaurant.rating, style: TextStyle(fontSize: 12)),
                      const Spacer(),
                      // Use spacer to push the heart icon to the end of the row
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.pink.shade300,
                          size: 15,
                        ),
                        onPressed: toggleFavorite,
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
  Cart buildCart() {
    Cart c = const Cart(
        name: "hello", price: 10, quantity: 1,
        userId: 100, restaurantId: 101, restaurantMenuItemId: 102
    );
    return c;
  }
}
// 'https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb='
class FavoriteManager {
  static final List<Restaurant> _favoriteRestaurants = [];

  static List<Restaurant> get favoriteRestaurants => _favoriteRestaurants;

  static void toggleFavorite(Restaurant restaurant) {
    if (_favoriteRestaurants.contains(restaurant)) {
      _favoriteRestaurants.remove(restaurant);
    } else {
      _favoriteRestaurants.add(restaurant);
    }
  }

  static bool isFavorite(Restaurant restaurant) {
    return _favoriteRestaurants.contains(restaurant);
  }
}
