import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/models/responses/login_response.dart';

import '../../utils/resources/data_state.dart';
import '../models/responses/restaurants_response.dart';
import '../models/requests/restaurants_request.dart';

abstract class ApiRepository {
  Future<DataState<RestaurantsResponse>> getRestaurantList({
    required RestaurantListRequest request,
  });

  Future<DataState<LoginResponse>> googleLogin({
    required LoginRequest request,
  });

  Future<DataState<LoginResponse>> phoneLogin({
    required LoginRequest request,
  });
}
