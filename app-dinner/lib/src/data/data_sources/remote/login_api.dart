import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../utils/constants/strings.dart';
import '../../../domain/models/responses/restaurants_response.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('/auth/login/google')
  Future<HttpResponse<RestaurantsResponse>> googleLogin();

  @POST('/auth/login/apple')
  Future<HttpResponse<RestaurantsResponse>> appleLogin();

  @POST('/auth/login/phone')
  Future<HttpResponse<RestaurantsResponse>> phoneLogin();
}
