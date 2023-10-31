import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../utils/constants/strings.dart';
import '../../../domain/models/responses/restaurants_response.dart';

part 'restaurants_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class RestaurantsApi {
  factory RestaurantsApi(Dio dio, {String baseUrl}) = _RestaurantsApi;

  @GET('/restaurants')
  Future<HttpResponse<RestaurantsResponse>> getRestaurants();
}
