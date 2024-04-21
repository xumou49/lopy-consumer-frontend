import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/presentation/cubits/order/order_place_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderBtn extends StatelessWidget {
  const PlaceOrderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
        text: "PLACE ORDER",
        onPressed: () {
          context.read<OrderPlaceCubit>().orderPlace(1, _getItemList());
          // route to order place status page (success / loading / failed) here
        });
  }

  // mock data
  List<Cart> _getItemList() {
    return [
      Cart(
          itemId: 1,
          name: "item-1",
          quantity: 1,
          price: 10,
          userId: 0,
          restaurantId: 0,
          restaurantMenuItemId: 0),
      Cart(
          itemId: 2,
          name: "item-2",
          quantity: 2,
          price: 20,
          userId: 0,
          restaurantId: 0,
          restaurantMenuItemId: 0),
      Cart(
          itemId: 3,
          name: "item-3",
          quantity: 3,
          price: 30,
          userId: 0,
          restaurantId: 0,
          restaurantMenuItemId: 0),
    ];
  }
}
