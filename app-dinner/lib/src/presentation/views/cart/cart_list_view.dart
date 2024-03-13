import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/presentation/cubits/cart/cart_list_cubit.dart';
import 'package:Lopy/src/utils/constants/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oktoast/oktoast.dart';

import '../../widgets/common/appbar_widget.dart';

@RoutePage()
class CartListView extends HookWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title:"Cart",
        showBackButton: true,
        onBackButtonPressed:() {
          context.router.pop();
        },),
      body: Column(
        children: [
          BlocListener<CartListCubit, CartListState>(
            listener: (context, state) {
              if (state is CartListSuccess) {}
            },
            child: BlocBuilder<CartListCubit, CartListState>(
              builder: (_, state) {
                switch (state.runtimeType) {
                  case CartListLoading:
                    return const Center(child: CupertinoActivityIndicator());
                  case CartListSuccess:
                    return _buildCartItemsList(state.cartItems);
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
          Container(
            width: double.infinity, // Set to maximum width
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle place order logic
                // You can navigate to a checkout page or perform other actions
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the corner radius as needed
                ),// Set desired button color
              ),

              child: Text('Place Order'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList(List<Cart> cartItems) {
    if (cartItems.isEmpty) {
      return const Center(
          child: Text(
            'No items added',
            style: TextStyle(color: Colors.black),
          ));
    }
    return Expanded(
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          print("====");
          print(cartItems[index].itemId);
          print(cartItems[index].name);
          print(cartItems[index].quantity);
          print(cartItems[index].price);
          print(cartItems[index].userId);
          print(cartItems[index].restaurantId);
          print(cartItems[index].restaurantMenuItemId);
          print("====");
          return CartItemWidget(item: cartItems[index]);
        },
      ),
    );
  }
}


class CartItemWidget extends HookWidget {
  final Cart item;
  const CartItemWidget({Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localACartCubit = BlocProvider.of<CartListCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8), // Adjust the padding as needed
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5, // Adjust the width of the line as needed
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)), // Optional: Add rounded corners
        ),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('lib/src/assets/images/loopy_profile.png'), // You can set an actual image here
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name),
              Text('Price: \$${item.price.toString()}'),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  localACartCubit.decrementCartItemQuantity(cartItem: item);
                },
              ),
              Text(item.quantity.toString()),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  localACartCubit.incrementCartItemQuantity(cartItem: item);
                },
              ),
              // _buildRemovableArea()
              IconButton(
                  icon: const Icon(Ionicons.trash_outline, color: Colors.red),
                  onPressed: () {
                    localACartCubit.removeCart(cartItem: item);
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
