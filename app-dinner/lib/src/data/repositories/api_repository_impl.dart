import 'package:Lopy/src/data/data_sources/remote/login_api.dart';
import 'package:Lopy/src/data/data_sources/remote/order_items_api.dart';
import 'package:Lopy/src/data/data_sources/remote/orders_api.dart';
import 'package:Lopy/src/data/data_sources/remote/restaurants_api.dart';
import 'package:Lopy/src/data/repositories/base/base_api_repository_impl.dart';
import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/models/requests/order_item_request.dart';
import 'package:Lopy/src/domain/models/requests/order_request.dart';
import 'package:Lopy/src/domain/models/requests/restaurants_request.dart';
import 'package:Lopy/src/domain/models/responses/login_response.dart';
import 'package:Lopy/src/domain/models/responses/order_item_response.dart';
import 'package:Lopy/src/domain/models/responses/order_response.dart';
import 'package:Lopy/src/domain/models/responses/restaurants_response.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';

import '../../utils/resources/data_state.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final RestaurantsApi _restaurantsApi;
  final OrdersApi _ordersApi;
  final OrderItemsApi _orderItemsApi;
  final LoginApi _loginApi;

  ApiRepositoryImpl(this._loginApi, this._restaurantsApi, this._ordersApi,
      this._orderItemsApi);

  @override
  Future<DataState<RestaurantsResponse>> getRestaurantList({
    required RestaurantListRequest request,
  }) {
    return getStateOf<RestaurantsResponse>(
      request: () => _restaurantsApi.getRestaurants(request),
    );
  }

  @override
  Future<DataState<OrderListResponse>> getOrderList(
      {required OrderListRequest request}) {
    return getStateOf<OrderListResponse>(
      request: () => _ordersApi.getOrderList(request),
    );
  }

  @override
  Future<DataState<OrderItemListResponse>> getOrderItemList(
      {required OrderItemListRequest request}) {
    return getStateOf<OrderItemListResponse>(
      request: () => _orderItemsApi.getOrderItemList(request),
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
}
