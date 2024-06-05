import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/presentation/cubits/order/order_item_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/order/order_list_cubit.dart';
import 'package:Lopy/src/presentation/views/home_bottom_navbar/orders/order_detail_view.dart';
import 'package:Lopy/src/presentation/widgets/common/appbar_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/empty_result_widget.dart';
import 'package:Lopy/src/presentation/widgets/order/order_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryOrderView extends StatelessWidget {
  const HistoryOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GradientAppBar(title: "History Orders"),
        body: BlocBuilder(
            bloc: BlocProvider.of<OrderListCubit>(context),
            builder: (BuildContext context, state) {
              if (state is OrderListSuccess && state.orders.isNotEmpty) {
                return _OrderHistoryOrderView(orders: state.orders);
              }
              return const Text("Order Data Is Empty");
            }));
  }
}

class _OrderHistoryOrderView extends StatefulWidget {
  List<Order> orders;
  _OrderHistoryOrderView({Key? key, required this.orders}) : super(key: key);

  @override
  State<_OrderHistoryOrderView> createState() => _OrderHistoryOrderViewState();
}

class _OrderHistoryOrderViewState extends State<_OrderHistoryOrderView> {
  List<Order> dataList = [];
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    dataList = widget.orders;
  }

  List<Order> getOrderData() {
    return dataList;
  }

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

  void searchOrder(String keyword) {
    if (keyword == "") {
      setState(() => dataList = widget.orders);
      return;
    }

    final suggestions = widget.orders.where((order) {
      final restaurantName = order.restaurantName!.toLowerCase();
      final text = keyword.toLowerCase();
      return restaurantName.contains(text);
    }).toList();

    setState(() => dataList = suggestions);
  }

  Widget getOrderHistoryDataSearchResultWidget() {
    List<Order> orders = getOrderData();
    // if result result in empty, return empty widget
    if (orders.isEmpty) {
      return EmptyResultWidget(
          title: "No Data",
          subtitle: "No relevant orders found with given keyword");
    }
    // build the widget from the data sets
    return Expanded(
        child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (ctx, index) {
              Order e = orders[index];
              return OrderCard(
                  restaurantId: e.restaurantId,
                  restaurantName: e.restaurantName,
                  totalPrice: e.totalCost,
                  completeDate: e.completeDate,
                  status: e.status,
                  onTap: () {
                    // send the event to fetch the data & show the dialog for order details
                    context.read<OrderItemListCubit>().getOrderItemList(e);
                    showOrderItemDetailDialog().call();
                  });
            }));
  }

  @override
  Widget build(BuildContext context) {
    List<Order> orders = getOrderData();
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Search Order",
                prefixIcon: Icon(Icons.search, color: Colors.pink.shade200),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.pink.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.pink.shade200),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: searchOrder,
            ),
          ),
          getOrderHistoryDataSearchResultWidget()
        ]));
  }
}
