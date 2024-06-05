import 'package:flutter/material.dart';

import '../../../domain/models/restaurant.dart';

class RestaurantInfoWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfoWidget({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 360,
        child: GestureDetector(
          onTap: () {
            //todo maybe?
          },
          child: Card(
            color: Colors.white,
            elevation: 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(restaurant.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(restaurant.labels!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ))
                    ],
                  ),
                  const Divider(thickness: 0.3),
                  const Text("Address",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                      )),
                  Text("${restaurant.address}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                      )),
                  const Divider(thickness: 0.3),
                  const Text("Operating Hours",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                      )),
                  Text("${restaurant.operatingHours}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
