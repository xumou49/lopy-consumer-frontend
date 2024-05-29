import 'package:flutter/material.dart';

import '../common/text_widget.dart';

class FavouriteHeaderWidget extends StatelessWidget {
  const FavouriteHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextWidget(
            text: "Your Favourite Cuisines",
            fontSize: 15.0,
            fontWeight: FontWeight.w600),
      ],
    );
  }
}
