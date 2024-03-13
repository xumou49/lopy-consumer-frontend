import 'package:Lopy/src/domain/models/requests/restaurant_info_request.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/restaurant.dart';
import '../../../domain/repositories/api_repository.dart';

part 'restaurant_info_state.dart';

class RestaurantInfoCubit extends BaseCubit<RestaurantInfoState, Restaurant> {
  final ApiRepository _apiRepository;

  RestaurantInfoCubit(this._apiRepository)
      : super(const RestaurantInfoLoading(), const Restaurant(name: '', imageUrl: '', rating: ''));

  Future<void> getRestaurantInfo(int restaurantId) async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getRestaurantInfo(
          request: RestaurantInfoRequest(id: restaurantId));
      print(response.toString());
      if (response is DataSuccess) {
        final restaurant = response.data!.restaurant;
        emit(RestaurantInfoSuccess(
            restaurant: restaurant, isData: restaurant != null));
      } else if (response is DataFailed) {
        emit(RestaurantInfoFailed(error: response.error));
      }
    });
  }
}
