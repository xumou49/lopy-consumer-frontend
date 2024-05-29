import 'package:flutter/material.dart';

import '../common/text_widget.dart';

class RestaurantsHeaderWidget extends StatelessWidget {
  const RestaurantsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextWidget(
            text: "All Restaurants",
            fontSize: 15.0,
            fontWeight: FontWeight.w600)
      ],
    );
  }
}
