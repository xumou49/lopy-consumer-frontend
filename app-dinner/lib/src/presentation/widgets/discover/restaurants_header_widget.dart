
import 'package:flutter/material.dart';

class RestaurantsHeaderWidget extends StatelessWidget {
  const RestaurantsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'All restaurants',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
