import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/restaurants_request.dart';
import '../../../domain/models/restaurant.dart';
import '../../../domain/repositories/api_repository.dart';

part 'restaurant_promo_state.dart';

class RestaurantPromoCubit
    extends BaseCubit<RestaurantPromoState, List<Restaurant>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  RestaurantPromoCubit(this._apiRepository, this._authRepository)
      : super(const RestaurantPromoLoading(), []);

  int _page = 1;

  Future<void> getRestaurantList({bool isPromotion = true}) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      token ??= "";
      final response = await _apiRepository.getRestaurantList(
          token: token,
          request: RestaurantListRequest(
              page: _page, promotionSearch: !isPromotion));
      if (response is DataSuccess) {
        final restaurants = response.data!.restaurants;
        final isData = restaurants.length < 4;

        data.addAll(restaurants);
        _page++;
        emit(RestaurantPromoSuccess(restaurants: restaurants, isData: isData));
      } else if (response is DataFailed) {
        emit(RestaurantPromoFailed(error: response.error));
      }
    });
  }
}
