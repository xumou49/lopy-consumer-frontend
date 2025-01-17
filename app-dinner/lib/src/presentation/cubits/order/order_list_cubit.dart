import 'package:Lopy/src/domain/models/order.dart';
import 'package:Lopy/src/domain/models/requests/order_request.dart';
import 'package:Lopy/src/domain/models/requests/page_request.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'order_list_state.dart';

class OrderListCubit extends BaseCubit<OrderListState, List<Order>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  OrderListCubit(this._apiRepository, this._authRepository)
      : super(const OrderListLoading(), []);

  Future<void> getOrderList(int page, int pageSize, {int type = 0}) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      final response = await _apiRepository.getOrderList(
          request: OrderListRequest(
              type: type,
              searchPage: PageRequest(page: page, pageSize: pageSize)),
          token: token!);
      if (response is DataSuccess) {
        final orders = response.data!.orders;
        emit(OrderListSuccess(orders: orders, isData: true));
      } else if (response is DataFailed) {
        emit(OrderListFailed(error: response.error));
      }
    });
  }
}
