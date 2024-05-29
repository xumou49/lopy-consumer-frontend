import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/routers/app_router.gr.dart';

class PromotionHeaderWidget extends StatelessWidget {
  const PromotionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const TextWidget(
            text: "Loopy Promotion for Today!",
            fontSize: 15.0,
            fontWeight: FontWeight.w600),
        InkWell(
          onTap: () {
            context.router.push(RestaurantListView());
          },
          child: const TextWidget(
              text: "View More", fontSize: 13.0, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

}
