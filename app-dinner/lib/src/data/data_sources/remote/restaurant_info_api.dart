import 'dart:ffi';

import 'package:Lopy/src/domain/models/responses/restaurant_info_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../utils/constants/strings.dart';

part 'restaurant_info_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class RestaurantInfoApi {
  factory RestaurantInfoApi(Dio dio, {String baseUrl}) = _RestaurantInfoApi;

  @GET('/restaurant/info')
  Future<HttpResponse<RestaurantInfoResponse>> getRestaurantInfo(
    @Query("id") int id,
  );
}
