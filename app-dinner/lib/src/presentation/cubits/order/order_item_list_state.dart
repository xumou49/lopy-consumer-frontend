part of "order_item_list_cubit.dart";

abstract class OrderItemListState extends Equatable {
  final Order order;
  final List<OrderItem> orderItems;
  final bool isData;
  final DioError? error;

  const OrderItemListState({
    this.order = const Order(),
    this.orderItems = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [orderItems, isData, error];
}

class OrderItemListLoading extends OrderItemListState {
  const OrderItemListLoading();
}

class OrderItemListSuccess extends OrderItemListState {
  const OrderItemListSuccess(
      {super.order, super.orderItems, super.isData, super.error});
}

class OrderItemListFailed extends OrderItemListState {
  const OrderItemListFailed({super.error});
}
