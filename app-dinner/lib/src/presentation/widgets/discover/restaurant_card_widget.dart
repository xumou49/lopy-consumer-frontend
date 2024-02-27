import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/routers/app_router.gr.dart';

enum RestaurantCardType { small, big }

class RestaurantCard extends StatelessWidget {
  final RestaurantCardType restaurantCardType;

  const RestaurantCard({Key? key, required this.restaurantCardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (restaurantCardType) {
      case RestaurantCardType.small:
        return buildSmallCard(context);
      case RestaurantCardType.big:
        return buildBigCard(context);
      default:
        return Container();
    }
  }

  Widget buildSmallCard(BuildContext context) {
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
                  context.router.push(RestaurantsNavigationView(
                      children: [RestaurantDetailView(restaurantId: 2)]));
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
                  const Text('Restaurant Name',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: Colors.amber, size: 12.5),
                      const Text(' 4.8 (1000+)',
                          style: TextStyle(fontSize: 10)),
                      const Spacer(),
                      // Use spacer to push the heart icon to the end of the row
                      Icon(
                        Icons.favorite_border,
                        color: Colors.pink.shade300,
                        size: 15,
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

  Widget buildBigCard(BuildContext context) {
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
              child: InkWell(
                onTap: () {
                  context.router.push(RestaurantsNavigationView(
                      children: [RestaurantDetailView(restaurantId: 1)]));
                },
                child: Image.network(
                  'https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb=',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Restaurant Name',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star, color: Colors.amber, size: 14.5),
                      const Text(' 4.8 (1000+)',
                          style: TextStyle(fontSize: 12)),
                      const Spacer(),
                      // Use spacer to push the heart icon to the end of the row
                      Icon(
                        Icons.favorite_border,
                        color: Colors.pink.shade300,
                        size: 15,
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
}
