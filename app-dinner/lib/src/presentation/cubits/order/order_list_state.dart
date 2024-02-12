part of 'order_list_cubit.dart';

abstract class OrderListState extends Equatable {
  final List<Order> orders;
  final bool isData;
  final DioError? error;

  const OrderListState({
    this.orders = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [orders, isData, error];
}

class OrderListLoading extends OrderListState {
  const OrderListLoading();
}

class OrderListSuccess extends OrderListState {
  const OrderListSuccess({super.orders, super.isData});
}

class OrderListFailed extends OrderListState {
  const OrderListFailed({super.error});
}
