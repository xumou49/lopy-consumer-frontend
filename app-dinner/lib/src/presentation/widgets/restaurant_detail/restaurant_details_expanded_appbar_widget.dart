import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_item_card_widget.dart';
import 'package:flutter/material.dart';

import 'number_counter_widget.dart';

class RestaurantDetailsExpandedAppbarWidget extends StatelessWidget {
  const RestaurantDetailsExpandedAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://welcon.kocca.kr/cmm/getImage.do?atchFileId=FILE_046d5e61-7fce-4dcb-86c4-f71f90e1a662&amp;fileSn=1&amp;thumb=",
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
