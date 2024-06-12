import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/restaurants_request.dart';
import '../../../domain/models/restaurant.dart';
import '../../../domain/repositories/api_repository.dart';

part 'restaurant_list_state.dart';

class RestaurantListCubit
    extends BaseCubit<RestaurantListState, List<Restaurant>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  RestaurantListCubit(this._apiRepository, this._authRepository)
      : super(const RestaurantListLoading(), []);

  int _page = 1;

  Future<void> getRestaurantList(
      {bool isPromotion = false, String cuisine = "", String name = ""}) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      token ??= "";
      final response = await _apiRepository.getRestaurantList(
          token: token,
          request: RestaurantListRequest(
              page: _page,
              promotionSearch: isPromotion,
              cuisine: cuisine,
              name: name));
      if (response is DataSuccess) {
        final restaurants = response.data!.restaurants;
        final isData = restaurants.length < 4;
        data.addAll(restaurants);
        _page++;
        emit(RestaurantListSuccess(restaurants: restaurants, isData: isData));
      } else if (response is DataFailed) {
        emit(RestaurantListFailed(error: response.error));
      }
    });
  }
}
