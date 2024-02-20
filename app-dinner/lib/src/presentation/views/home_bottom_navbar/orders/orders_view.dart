import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/presentation/cubits/order/order_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/appbar_widget.dart';
import 'package:Lopy/src/presentation/widgets/order/order_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_detail_view.dart';

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
              if (state is OrderListSuccess && state.orders.isNotEmpty) {
                return _OrdersView(orders: state.orders);
              }
              return const Text("Order Data Is Empty");
            }));
  }
}

class _OrdersView extends StatefulWidget {
  final List<Order> orders;
  const _OrdersView({Key? key, required this.orders}) : super(key: key);

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<_OrdersView> {
  Function() showOrderItemDetailDialog() {
    return () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => const Dialog(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: SizedBox(
                    height: 600,
                    child: OrdersDetailView(),
                  )),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var len = MediaQuery.of(context).size.width - 20;
    print("len: $len");
    // build widget from data sets
    List<Widget> orderCards = [];
    for (var e in widget.orders) {
      orderCards.add(OrderCard(
          restaurantId: e.restaurantId,
          restaurantName: e.restaurantName,
          totalPrice: e.totalCost,
          completeDate: e.completeDate,
          status: e.status,
          onTap: showOrderItemDetailDialog()));
    }
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: const EdgeInsets.only(top: 20),
            child: ListView(
              children: orderCards,
            )));
  }
}
