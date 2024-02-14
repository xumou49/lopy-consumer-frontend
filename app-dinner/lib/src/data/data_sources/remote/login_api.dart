import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/models/responses/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../utils/constants/strings.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('/auth/login/google')
  Future<HttpResponse<LoginResponse>> googleLogin(
      @Body() LoginRequest loginRequest);

  @POST('/auth/login/apple')
  Future<HttpResponse<LoginResponse>> appleLogin(
      @Body() LoginRequest loginRequest);

  @POST('/auth/login/phone')
  Future<HttpResponse<LoginResponse>> phoneLogin(
      @Body() LoginRequest loginRequest);
}
