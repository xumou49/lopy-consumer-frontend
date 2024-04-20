import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/domain/models/order_item.dart';
import 'package:Lopy/src/domain/models/requests/order_item_request.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'order_item_list_state.dart';

class OrderItemListCubit
    extends BaseCubit<OrderItemListState, List<OrderItem>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  OrderItemListCubit(this._apiRepository, this._authRepository)
      : super(const OrderItemListLoading(), []);

  Future<void> getOrderItemList(Order order) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      final response = await _apiRepository.getOrderItemList(
          token: token!, request: OrderItemListRequest(orderId: order.id!));
      if (response is DataSuccess) {
        final orders = response.data!.orderItems;
        emit(OrderItemListSuccess(
            order: order, orderItems: orders, isData: true));
      } else if (response is DataFailed) {
        emit(OrderItemListFailed(error: response.error));
      }
      print("complete get order item list");
    });
  }
}
