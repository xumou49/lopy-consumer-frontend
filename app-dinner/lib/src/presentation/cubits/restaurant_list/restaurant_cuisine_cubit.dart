import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/requests/restaurants_request.dart';
import '../../../domain/models/restaurant.dart';
import '../../../domain/repositories/api_repository.dart';

part 'restaurant_cuisine_state.dart';

class RestaurantCuisineCubit
    extends BaseCubit<RestaurantCuisineState, List<Restaurant>> {
  final ApiRepository _apiRepository;
  final AuthRepository _authRepository;

  RestaurantCuisineCubit(this._apiRepository, this._authRepository)
      : super(const RestaurantCuisineLoading(), []);

  int _page = 1;

  Future<void> getRestaurantList(
      {String cuisine = "",
      String action = "",
      List<int> idList = const []}) async {
    if (isBusy) return;

    await run(() async {
      String? token = await _authRepository.getToken();
      token ??= "";
      final response = await _apiRepository.getRestaurantList(
          token: token,
          request: RestaurantListRequest(
              page: _page, cuisine: cuisine, idList: idList));
      if (response is DataSuccess) {
        if (response.data!.restaurants.isEmpty) {
          emit(const RestaurantCuisineEmpty());
          return;
        }

        final restaurants = response.data!.restaurants;
        final isData = restaurants.length < 4;
        data.addAll(restaurants);
        _page++;
        emit(
            RestaurantCuisineSuccess(restaurants: restaurants, isData: isData));
      } else if (response is DataFailed) {
        emit(RestaurantCuisineFailed(error: response.error));
      }
    });
  }
}
