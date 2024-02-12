import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/models/requests/order_request.dart';
import 'package:Lopy/src/domain/models/requests/restaurants_request.dart';
import 'package:Lopy/src/domain/models/responses/login_response.dart';
import 'package:Lopy/src/domain/models/responses/order_response.dart';
import 'package:Lopy/src/domain/models/responses/restaurants_response.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<RestaurantsResponse>> getRestaurantList({
    required RestaurantListRequest request,
  });

  Future<DataState<OrderResponse>> getOrderList({
    required OrderListRequest request,
  });

  Future<DataState<LoginResponse>> googleLogin({
    required LoginRequest request,
  });

  Future<DataState<LoginResponse>> phoneLogin({
    required LoginRequest request,
  });
}
