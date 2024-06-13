import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/requests/restaurants_request.dart';
import '../../../domain/models/responses/restaurants_response.dart';
import '../../../utils/constants/strings.dart';

part 'restaurants_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class RestaurantsApi {
  factory RestaurantsApi(Dio dio, {String baseUrl}) = _RestaurantsApi;

  @POST('/restaurant/list')
  Future<HttpResponse<RestaurantsResponse>> getRestaurants(
      @Header(tokenName) String token, @Body() RestaurantListRequest request,
      {@Header('Content-Type') String contentType = 'application/json'});
}
