import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/presentation/cubits/order/order_list_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
          title: const Text("Order"),
        ),
        body: BlocBuilder(
            bloc: BlocProvider.of<OrderListCubit>(context),
            builder: (BuildContext context, state) {
              if (state is OrderListSuccess && state.orders.isNotEmpty) {
                return OrderListView(orders: state.orders);
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
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
                "id: ${orders[i].id}, restaurantId: ${orders[i].restaurantId}, restaurantName: ${orders[i].restaurantName}, "
                "status: ${orders[i].status}, taxes: ${orders[i].taxes}, "
                "discounts: ${orders[i].discounts}, completedDate: ${orders[i].completeDate}"),
          );
        });
  }
}
