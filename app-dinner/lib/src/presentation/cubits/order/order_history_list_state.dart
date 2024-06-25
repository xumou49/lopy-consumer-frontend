part of "order_history_list_cubit.dart";

abstract class OrderHistoryListState extends Equatable {
  final List<Order> orders;
  final bool isData;
  final DioError? error;

  const OrderHistoryListState({
    this.orders = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [orders, isData, error];
}

class OrderHistoryListLoading extends OrderHistoryListState {
  const OrderHistoryListLoading();
}

class OrderHistoryListSuccess extends OrderHistoryListState {
  const OrderHistoryListSuccess({super.orders, super.isData, super.error});
}

class OrderHistoryListFailed extends OrderHistoryListState {
  const OrderHistoryListFailed({super.error});
}
