import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/domain/models/order_item.dart';
import 'package:Lopy/src/presentation/cubits/order/order_item_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/expansion_widget.dart';
import 'package:Lopy/src/presentation/widgets/order/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersDetailView extends StatelessWidget {
  const OrdersDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<OrderItemListCubit>(context),
        builder: (BuildContext context, state) {
          if (state is OrderItemListSuccess && state.orderItems.isNotEmpty) {
            return _View(order: state.order, orderItems: state.orderItems);
          }
          return const Text("Order Detail is Empty");
        });
  }
}

class _View extends StatelessWidget {
  final Order order;
  final List<OrderItem> orderItems;
  const _View({required this.order, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // restaurantName & orderId
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [OrderDetailText("${order.restaurantName}")],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [OrderDetailText("Order ID: ${order.uid}")],
        ),
        const SizedBox(height: 15),
        const Divider(),
        // order items
        OrderDetailItemsView(
          orderItems: orderItems,
        ),
        const SizedBox(height: 15),
        const Divider(),
        // total prices
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const OrderDetailText("GST"),
            OrderDetailText("\$${order.taxes?.toStringAsFixed(2)}"),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const OrderDetailText("Total"),
            OrderDetailText("\$${order.totalCost}"),
          ],
        ),
      ],
    );
  }
}

class OrderDetailItemsView extends StatefulWidget {
  final List<OrderItem> orderItems;
  const OrderDetailItemsView({Key? key, required this.orderItems})
      : super(key: key);

  @override
  State<OrderDetailItemsView> createState() => _OrderDetailItemsViewState();
}

class _OrderDetailItemsViewState extends State<OrderDetailItemsView> {
  final ExpansionTileController controller = ExpansionTileController();

  List<Widget> _getOrderDetailItems() {
    // add the header info to list first
    List<Widget> list = [
      const OrderDetailHeader(
          title1: "Name", title2: "Quantity", title3: "Price")
    ];
    // add order item to list
    for (var e in widget.orderItems) {
      list.add(OrderDetailItem(
          name: e.itemName!,
          quantity: "x${e.quantity!}",
          price: "\$${e.itemPrice!}"));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
        child: Column(
      children: _getOrderDetailItems(),
    ));
  }
}
