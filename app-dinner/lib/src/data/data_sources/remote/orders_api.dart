import 'package:Lopy/src/domain/models/requests/order_request.dart';
import 'package:Lopy/src/domain/models/responses/order_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/constants/strings.dart';

part 'orders_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class OrdersApi {
  factory OrdersApi(Dio dio, {String baseUrl}) = _OrdersApi;

  @POST('/order/list')
  Future<HttpResponse<OrderListResponse>> getOrderList(
      @Header(tokenName) String token,
      @Body() OrderListRequest orderListRequest);

  @POST('/order/page')
  Future<HttpResponse<OrderListResponse>> getOrderPage(
      @Header(tokenName) String token,
      @Body() OrderListRequest orderListRequest);

  @PUT('/order/save')
  Future<HttpResponse<String>> orderPlace(
      @Header(tokenName) String token, @Body() OrderPlaceRequest request,
      {@Header('Content-Type') String contentType = 'application/json'});
}
