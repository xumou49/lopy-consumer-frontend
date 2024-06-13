import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/presentation/widgets/common/image_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import '../../../domain/models/menu_item.dart';
import '../../cubits/cart/cart_list_cubit.dart';
import '../common/button_widget.dart';
import '../common/text_widget.dart';
import 'number_counter_widget.dart';

class MenuItemDialogWidget extends StatelessWidget {
  final MenuItem menuItem;
  final int restaurantId;

  const MenuItemDialogWidget(
      {Key? key, required this.menuItem, required this.restaurantId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localACartCubit = BlocProvider.of<CartListCubit>(context);
    int counter = 1;
    return Dialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 435,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(8.0),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero),
                      child: ImageWidget(
                          imageUrl: menuItem.imageUrl, height: 180.0),
                    )),
                Align(
                    alignment: const Alignment(0.95, 0.5),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 25,
                      ),
                    )),
              ],
            ),
            Padding(
              // padding: EdgeInsets.all(20.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                        text: menuItem.itemName,
                        fontSize: 14,
                      )),
                      Expanded(
                          child: TextWidget(
                              text: 'S\$${menuItem.price}',
                              textAlign: TextAlign.end,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Divider(thickness: 0.3),
                  const Row(
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                              text: 'MenuItem Detail Description',
                              fontSize: 14)),
                    ],
                  ),
                  const PlaceholderWidget(height: 5.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                              text: menuItem.description, fontSize: 14)),
                    ],
                  ),
                  const PlaceholderWidget(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CounterStep(
                          min: 1,
                          max: 10,
                          valueChanged: (int value) {
                            counter = value;
                          })
                    ],
                  ),
                  const PlaceholderWidget(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        // child: ButtonWidget(
                        //     text: 'Add to Cart',
                        //     height: 40.0,
                        //     onPressed: () {
                        //       Cart c = Cart(
                        //           name: menuItem.itemName,
                        //           quantity: counter,
                        //           price: menuItem.price,
                        //           // userId: userId,
                        //           // restaurantId: restaurantId,
                        //           userId: 1,
                        //           restaurantId: restaurantId,
                        //           restaurantMenuItemId: menuItem.menuId);
                        //       print(c);
                        //       localACartCubit.saveCart(cartItem: c);
                        //       showToast('Added Successfully');
                        //       Navigator.pop(context);
                        //     }
                        //     ),
                        child: BlocBuilder<CartListCubit, CartListState>(
                          builder: (_, state) {
                            switch (state.runtimeType) {
                              case CartListLoading:
                                return const Center(child: CupertinoActivityIndicator());
                              case CartListSuccess:
                                return ButtonWidget(
                                  text: 'Add to Cart',
                                  height: 40.0,
                                  onPressed: () {
                                    Cart c = Cart(
                                      name: menuItem.itemName,
                                      quantity: counter,
                                      price: menuItem.price,
                                      userId: 1,
                                      restaurantId: restaurantId,
                                      // restaurantId: 10,
                                      restaurantMenuItemId:
                                      menuItem.menuId,
                                    );
                                    if (state.cartItems.isNotEmpty) {
                                      if (state.cartItems[0].restaurantId != restaurantId) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Warning'),
                                              content: const Text('Multiple restaurants: Do you want clear the existing items in cart?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Yes'),
                                                  onPressed: () {
                                                    localACartCubit.clearCart(state.cartItems[0].restaurantId);
                                                    print(c);
                                                    print("addddd");
                                                    localACartCubit.saveCart(cartItem: c);
                                                    showToast('Added Successfully');
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('No'),
                                                  onPressed: () {
                                                    Navigator.pop(context); // Close the dialog
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   builder: (BuildContext context) {
                                        //     return Container(
                                        //       height: 200,
                                        //       child: Center(
                                        //         child: Column(
                                        //           mainAxisAlignment: MainAxisAlignment.center,
                                        //           children: <Widget>[
                                        //             const Text(
                                        //               'This is a Popup!',
                                        //               style: TextStyle(fontSize: 20),
                                        //             ),
                                        //             SizedBox(height: 20),
                                        //             ElevatedButton(
                                        //               onPressed: () {
                                        //                 Navigator.pop(context); // Close the popup
                                        //               },
                                        //               child: Text('Close'),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        // );
                                        // localACartCubit.clearCart(state.cartItems[0].restaurantId);
                                      }
                                    } else {
                                      print(c);
                                      localACartCubit.saveCart(cartItem: c);
                                      showToast('Added Successfully');
                                      Navigator.pop(context);
                                    }
                                    // print(c);
                                    // localACartCubit.saveCart(cartItem: c);
                                    // showToast('Added Successfully');
                                    // Navigator.pop(context);
                                  },
                                );
                              default:
                                return const SizedBox();
                            }
                          },
                        ),
                      )
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

