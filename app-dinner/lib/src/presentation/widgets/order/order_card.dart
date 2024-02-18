import 'package:Lopy/src/presentation/widgets/order/order_info.dart';
import 'package:Lopy/src/presentation/widgets/order/order_status.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final num? restaurantId;
  final String? restaurantName;
  final double? totalPrice;
  final String? completeDate;
  final int? status;

  const OrderCard(
      {Key? key,
      required this.status,
      this.restaurantId,
      this.restaurantName,
      this.totalPrice,
      this.completeDate})
      : super(key: key);

  List<Widget> _getOrderItems(int status) {
    // must have order info
    List<Widget> list = [
      OrderInfo(
        restaurantId: restaurantId,
        restaurantName: restaurantName,
        totalPrice: totalPrice,
        completeDate: completeDate,
      ),
    ];
    // if it is completed order, simply return
    if (!_isOngoingOrder(status)) {
      return list;
    }
    // not a completed order, should include the status transition bar
    list.addAll([
      const SizedBox(height: 10),
      const Divider(),
      const SizedBox(height: 40),
      OrderStatusTransition(status: status)
    ]);
    return list;
  }

  double _getCardHeight(int status) {
    // if order status is completed, hide the status transition bar, lower the height
    if (_isOngoingOrder(status)) {
      return 183;
    }
    return 79;
  }

  bool _isOngoingOrder(int status) {
    return 0 <= status && status < 3;
  }

  @override
  Widget build(BuildContext context) {
    double cardHeight = _getCardHeight(status!);
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Color(0xFFE6E0E9),
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            width: double.infinity,
            height: cardHeight,
            child: Column(children: _getOrderItems(status!))),
      ),
    );
  }
}
