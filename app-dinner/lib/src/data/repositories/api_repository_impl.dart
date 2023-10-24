

import 'package:Lopy/src/data/data_sources/remote/restaurants_api.dart';
import 'package:Lopy/src/data/repositories/base/base_api_repository_impl.dart';
import 'package:Lopy/src/domain/models/requests/restaurants_request.dart';
import 'package:Lopy/src/domain/models/responses/restaurants_response.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';

import '../../utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final RestaurantsApi _restaurantsApi;

  ApiRepositoryImpl(this._restaurantsApi);

  @override
  Future<DataState<RestaurantsResponse>> getRestaurantList({
    required RestaurantListRequest request,
  }) {
    return getStateOf<RestaurantsResponse>(
      request: () => _restaurantsApi.getRestaurants(
      ),
    );
  }
}