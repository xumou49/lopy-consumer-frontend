import 'package:Lopy/src/presentation/widgets/common/expansion_widget.dart';
import 'package:Lopy/src/presentation/widgets/order/order_detail.dart';
import 'package:flutter/material.dart';

class OrdersDetailView extends StatelessWidget {
  const OrdersDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // restaurantName & orderId
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [OrderDetailText("Restaurant Name")],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [OrderDetailText("Order ID: xxxxxxxxxxxxxxxxxxxxxx")],
        ),
        SizedBox(height: 15),
        Divider(),
        // order items
        OrderDetailItemsView(),
        SizedBox(height: 15),
        Divider(),
        // total prices
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OrderDetailText("GST"),
            OrderDetailText("\$XX.YY"),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            OrderDetailText("Total"),
            OrderDetailText("\$XX.YY"),
          ],
        ),
      ],
    );
  }
}

class OrderDetailItemsView extends StatefulWidget {
  const OrderDetailItemsView({Key? key}) : super(key: key);

  @override
  State<OrderDetailItemsView> createState() => _OrderDetailItemsViewState();
}

class _OrderDetailItemsViewState extends State<OrderDetailItemsView> {
  final ExpansionTileController controller = ExpansionTileController();

  List<Widget> _getOrderDetailItems() {
    var list = [
      const OrderDetailHeader(
          title1: "Name", title2: "Quantity", title3: "Price"),
      const OrderDetailItem(name: "Name1", quantity: "x1", price: "\$1.99"),
      const OrderDetailItem(name: "Name2", quantity: "x10", price: "\$11.99"),
      const OrderDetailItem(name: "Name3", quantity: "x100", price: "\$111.99"),
    ];
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
