import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


import '../../../config/routers/app_router.gr.dart';

import '../../views/favorite_list/favorite_view.dart';
import '../common/text_widget.dart';


class FavouriteHeaderWidget extends StatelessWidget {
  const FavouriteHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            context.router.push(FavoriteView());
          },
          child: const Text(
            'Your favourite cuisines',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        TextWidget(
            text: "Your Favourite Cuisines",
            fontSize: 15.0,
            fontWeight: FontWeight.w600),

      ],
    );
  }
}
