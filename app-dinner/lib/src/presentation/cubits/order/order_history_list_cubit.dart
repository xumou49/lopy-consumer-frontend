import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/domain/models/requests/order_request.dart';
import 'package:Lopy/src/domain/models/requests/page_request.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/constants/nums.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'order_history_list_state.dart';

class OrderHistoryListCubit extends BaseCubit<OrderHistoryListState, List<Order>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  OrderHistoryListCubit(this._apiRepository, this._authRepository)
      : super(const OrderHistoryListLoading(), []);

  Future<void> getOrderList(int page, int pageSize) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      final response = await _apiRepository.getOrderList(
          request: OrderListRequest(
              type: orderTypeHistory,
              searchPage: PageRequest(page: page, pageSize: pageSize)),
          token: token!);
      if (response is DataSuccess) {
        final orders = response.data!.orders;
        emit(OrderHistoryListSuccess(orders: orders, isData: true));
      } else if (response is DataFailed) {
        emit(OrderHistoryListFailed(error: response.error));
      }
    });
  }
}
