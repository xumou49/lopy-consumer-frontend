import 'package:flutter/material.dart';

import '../../../domain/models/restaurant.dart';

enum RestaurantCardType {small, big}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final RestaurantCardType restaurantCardType;

  const RestaurantCard({Key? key, required this.restaurant, required this.restaurantCardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (restaurantCardType) {
      case RestaurantCardType.small:
        return buildSmallCard(restaurant);
      case RestaurantCardType.big:
        return buildBigCard(restaurant);
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
              child: Image.network(
                'https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb=',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(restaurant.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: Colors.amber, size: 12.5),
                      Text(restaurant.rating, style: TextStyle(fontSize: 10)),
                      const Spacer(),
                      // Use spacer to push the heart icon to the end of the row
                      Icon(Icons.favorite_border, color: Colors.pink.shade300, size: 15,),
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

  Widget buildBigCard(Restaurant restaurant) {
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
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: Colors.amber, size: 14.5),
                      Text(restaurant.rating, style: TextStyle(fontSize: 12)),
                      const Spacer(),
                      // Use spacer to push the heart icon to the end of the row
                      Icon(Icons.favorite_border, color: Colors.pink.shade300, size: 15,),
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
}

// 'https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb='