import '../../utils/resources/data_state.dart';
import '../models/responses/restaurants_response.dart';
import '../models/requests/restaurants_request.dart';

abstract class ApiRepository {
  Future<DataState<RestaurantsResponse>> getRestaurantList({
    required RestaurantListRequest request,
  });
}
