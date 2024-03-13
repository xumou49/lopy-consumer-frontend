import 'package:Lopy/src/domain/models/responses/user_card_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../domain/models/requests/user_card_request.dart';
import '../../../utils/constants/strings.dart';

part 'user_card_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class UserCardApi {
  factory UserCardApi(Dio dio, {String baseUrl}) = _UserCardApi;

  @PUT('/user-card/save')
  Future<HttpResponse<UserCardResponse>> saveUserCard(
      @Body() UserCardRequest request,
      {@Header('Content-Type') String contentType = 'application/json'});
}
