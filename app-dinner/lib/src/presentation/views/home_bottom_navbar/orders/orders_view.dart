import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/presentation/cubits/order/order_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/appbar_widget.dart';
import 'package:Lopy/src/presentation/widgets/order/order_info.dart';
import 'package:Lopy/src/presentation/widgets/order/order_status_bar.dart';
import 'package:Lopy/src/presentation/widgets/order/order_status_icon.dart';
import 'package:Lopy/src/presentation/widgets/order/order_status_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GradientAppBar(title: "My Orders"),
        body: BlocBuilder(
            bloc: BlocProvider.of<OrderListCubit>(context),
            builder: (BuildContext context, state) {
              // return const OrderListViewV1();
              if (state is OrderListSuccess && state.orders.isNotEmpty) {
                return OrderListView(orders: state.orders);
                return const OrderListViewV1();
              }
              return Text("Order Data Is Empty");
            }));
  }
}

class OrderListView extends StatelessWidget {
  final List<Order> orders;
  const OrderListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [OngoingOrder()];
    for (var order in orders) {
      var historyOrder = Container(
        width: double.infinity,
        height: 79,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        // background box
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE6E0E9)),
          borderRadius: BorderRadius.circular(5),
        )),
        child: OrderInfo(
          restaurantId: order.restaurantId,
          restaurantName: order.restaurantName,
          totalPrice: order.totalCost,
          completeDate: order.completeDate,
        ),
      );
      list.add(historyOrder);
    }
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: const EdgeInsets.only(top: 20),
            child: ListView(
              children: list,
            )));
  }
}

class OrderListViewV1 extends StatefulWidget {
  const OrderListViewV1({Key? key}) : super(key: key);

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrderListViewV1> {
  Widget _getHistoryOrder() {
    return const Text("history orders");
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: const EdgeInsets.only(top: 20),
            child: ListView(
              children: const [OngoingOrder(), HistoryOrder()],
            )));
  }
}

class OngoingOrder extends StatelessWidget {
  const OngoingOrder({super.key});

  Widget _getOrderInfo() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Restaurant Name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total (Incl. GST)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                )),
            Text(
              '\$XX.YY',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getOrderStatusBar(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    double barWidth = (screenWidth - 60 - 26 * 3) / 2;
    // 1: pending
    // 2: processing
    // 3: completed
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Column(
          children: [
            // progress bar
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const OrderStatusIcon(
                        isColorFill: true,
                        color: Color(0xFFF38181),
                        content: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16.0,
                        )),
                    OrderStatusBar(
                        width: barWidth, color: const Color(0xFFF18484)),
                    const OrderStatusIcon(
                        isColorFill: false,
                        color: Color(0xFFF38181),
                        content: Icon(
                          Icons.circle,
                          color: Color(0xFFF38181),
                          size: 10.0,
                        )),
                    OrderStatusBar(
                        width: barWidth, color: const Color(0xFFD1D5DB)),
                    const OrderStatusIcon(
                      isColorFill: false,
                      color: Color(0xFFD1D5DB),
                    )
                  ]),
            ),
            const SizedBox(height: 10),
            // text
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrderStatusText("accepting"),
                  OrderStatusText("preparing"),
                  OrderStatusText("completed")
                ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 183,
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      // background box
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFE6E0E9)),
        borderRadius: BorderRadius.circular(5),
      )),
      child: Column(children: [
        // _getOrderInfo(), // order
        OrderInfo(),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 40),
        _getOrderStatusBar(context),
      ]),
    );
  }
}

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 79,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      // background box
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFE6E0E9)),
        borderRadius: BorderRadius.circular(5),
      )),
      child: const OrderInfo(
        completeDate: "01/01/2024",
      ),
    );
  }
}
