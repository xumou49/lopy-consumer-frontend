import 'package:Lopy/src/domain/models/requests/order_item_request.dart';
import 'package:Lopy/src/domain/models/responses/order_item_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/constants/strings.dart';

part 'order_items_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class OrderItemsApi {
  factory OrderItemsApi(Dio dio, {String baseUrl}) = _OrderItemsApi;

  @POST('/order-item/list')
  Future<HttpResponse<OrderItemListResponse>> getOrderItemList(
      @Body() OrderItemListRequest orderListRequest);

  @POST('/order-item/page')
  Future<HttpResponse<OrderItemListResponse>> getOrderItemPage(
      @Body() OrderItemListRequest orderListRequest);
}
