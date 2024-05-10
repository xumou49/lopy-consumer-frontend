import 'package:Lopy/src/domain/models/responses/response.dart';
import 'package:Lopy/src/domain/models/responses/user_card_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/requests/user_card_request.dart';
import '../../../utils/constants/strings.dart';

part 'user_card_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class UserCardApi {
  factory UserCardApi(Dio dio, {String baseUrl}) = _UserCardApi;

  @POST("/user-card/list")
  Future<HttpResponse<UserCardListResponse>> getUserCardList(
      @Header(tokenName) String token, @Body() UserCardListRequest request);

  @PUT('/user-card/save')
  Future<HttpResponse<BaseResponse>> saveUserCard(
      @Header(tokenName) String token, @Body() UserCardRequest request,
      {@Header('Content-Type') String contentType = 'application/json'});
}
