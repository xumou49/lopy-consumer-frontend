import 'package:Lopy/src/domain/models/requests/restaurant_info_request.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/restaurant.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'restaurant_info_state.dart';

class RestaurantInfoCubit extends BaseCubit<RestaurantInfoState, Restaurant> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  RestaurantInfoCubit(this._apiRepository, this._authRepository)
      : super(const RestaurantInfoLoading(),
            const Restaurant(name: '', imageUrl: '', rating: ''));

  Future<void> getRestaurantInfo(int restaurantId) async {
    if (isBusy) return;
    emit(const RestaurantInfoLoading());

    await run(() async {
      String? token = await _authRepository.getToken();
      token ??= "";
      final response = await _apiRepository.getRestaurantInfo(
          token: token, request: RestaurantInfoRequest(id: restaurantId));

      if (response is DataSuccess) {
        final restaurant = response.data!.restaurant;
        emit(RestaurantInfoSuccess(
            restaurant: restaurant, isData: restaurant != null));
      } else if (response is DataFailed) {
        emit(RestaurantInfoFailed(error: response.error));
      } else if (response is DataNotSet) {
        emit(const RestaurantInfoLoading());
      }
    });
  }
}
