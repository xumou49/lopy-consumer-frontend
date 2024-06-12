import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/presentation/cubits/order/order_place_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import '../../views/home_bottom_navbar/profile/payment_method/payment_method_view.dart';
import '../common/placeholder_widget.dart';
import '../payment_method/method_board.dart';

// class PlaceOrderBtn extends StatelessWidget {
//   final List<Cart> carts;
//   const PlaceOrderBtn({super.key, required this.carts});
//
//   @override
//   Widget build(BuildContext context) {
//     return ButtonWidget(
//         text: "PLACE ORDER",
//         onPressed: () {
//           // context
//           //     .read<OrderPlaceCubit>()
//           //     .orderPlace(carts.first.restaurantId, carts);
//           Future.delayed(const Duration(milliseconds: 2000), () {
//             showToast("Order placed successfully");
//           });
//           // route to order place status page (success / loading / failed) here
//         });
//   }

class PlaceOrderBtn extends StatelessWidget {
  final List<Cart> carts;
  const PlaceOrderBtn({super.key, required this.carts});

  @override
  Widget build(BuildContext context) {
    return ChoosePaymentModal(carts: carts,);
  }

  // mock data
  List<Cart> _getItemList() {
    return [
      const Cart(
          itemId: 1,
          name: "item-1",
          quantity: 1,
          price: 10,
          userId: 0,
          restaurantId: 0,
          restaurantMenuItemId: 0),
      const Cart(
          itemId: 2,
          name: "item-2",
          quantity: 2,
          price: 20,
          userId: 0,
          restaurantId: 0,
          restaurantMenuItemId: 0),
      const Cart(
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

class ChoosePaymentModal extends StatelessWidget {
  final List<Cart> carts;
  const ChoosePaymentModal({super.key, required this.carts});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonWidget(
        text: "PLACE ORDER",
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 350,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const PlaceholderWidget(height: 30,),
                      MethodDataDisplayBoard(isPay: true, carts: carts),
                      // const UserCardDisplay(type: 'visa',),
                      const PlaceholderWidget(height: 30,),
                      // Center(
                      //   child: Row(
                      //     children: [
                      //       const PlaceholderWidget(width: 60,),
                      //
                      //       ElevatedButton(
                      //         style: style,
                      //         child: const Text('Back'),
                      //         onPressed: () => Navigator.pop(context),
                      //       ),
                      //       const PlaceholderWidget(width: 120,),
                      //       ElevatedButton(
                      //         style: style,
                      //         child: const Text('Pay'),
                      //         onPressed: () => Navigator.pop(context),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // ElevatedButton(
                      //   child: const Text('Close Bottom'),
                      //   onPressed: () => Navigator.pop(context),
                      // ),
                    ],
                  ),
                ),
              ));
            },
          );
        },
      ),
    );
  }
}
