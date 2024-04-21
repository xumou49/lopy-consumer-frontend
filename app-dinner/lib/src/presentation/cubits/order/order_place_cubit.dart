import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/domain/models/requests/order_request.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/api_repository.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'order_place_state.dart';

class OrderPlaceCubit extends BaseCubit<OrderPlaceState, String> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  OrderPlaceCubit(this._apiRepository, this._authRepository)
      : super(const OrderPlaceLoading(), "");

  Future<void> orderPlace(num restaurantId, List<Cart> itemList) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      final response = await _apiRepository.orderPlace(
          token: token!,
          request: OrderPlaceRequest(
              restaurantId: restaurantId, itemList: itemList));
      if (response is DataSuccess) {
        final uid = response.data!;
        emit(OrderPlaceSuccess(uid: uid, isData: true));
      } else if (response is DataFailed) {
        emit(OrderPlaceFailed(error: response.error));
      }
    });
  }
}
