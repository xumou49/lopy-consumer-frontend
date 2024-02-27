import 'package:Lopy/src/data/data_sources/remote/login_api.dart';
import 'package:Lopy/src/data/data_sources/remote/restaurant_info_api.dart';
import 'package:Lopy/src/data/data_sources/remote/restaurants_api.dart';
import 'package:Lopy/src/data/repositories/base/base_api_repository_impl.dart';
import 'package:Lopy/src/domain/models/requests/RestaurantInfoRequest.dart';
import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/models/requests/restaurants_request.dart';
import 'package:Lopy/src/domain/models/responses/login_response.dart';
import 'package:Lopy/src/domain/models/responses/restaurant_info_response.dart';
import 'package:Lopy/src/domain/models/responses/restaurants_response.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';

import '../../utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final RestaurantsApi _restaurantsApi;
  final LoginApi _loginApi;
  final RestaurantInfoApi _restaurantInfoApi;

  ApiRepositoryImpl(
      this._restaurantsApi, this._loginApi, this._restaurantInfoApi);

  @override
  Future<DataState<RestaurantsResponse>> getRestaurantList({
    required RestaurantListRequest request,
  }) {
    return getStateOf<RestaurantsResponse>(
      request: () => _restaurantsApi.getRestaurants(),
    );
  }

  @override
  Future<DataState<LoginResponse>> googleLogin(
      {required LoginRequest request}) {
    return getStateOf<LoginResponse>(
        request: () => _loginApi.googleLogin(request));
  }

  @override
  Future<DataState<LoginResponse>> phoneLogin({required LoginRequest request}) {
    return getStateOf<LoginResponse>(
        request: () => _loginApi.phoneLogin(request));
  }

  @override
  Future<DataState<RestaurantInfoResponse>> getRestaurantInfo({
    required RestaurantInfoRequest request,
  }) {
    return getStateOf<RestaurantInfoResponse>(
      request: () => _restaurantInfoApi.getRestaurantInfo(request.id),
    );
  }
}
