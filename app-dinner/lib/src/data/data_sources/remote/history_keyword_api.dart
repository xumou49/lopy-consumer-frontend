import 'package:Lopy/src/domain/models/responses/history_keyword_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/constants/strings.dart';

part 'history_keyword_api.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class HistoryKeywordApi {
  factory HistoryKeywordApi(Dio dio, {String baseUrl}) = _HistoryKeywordApi;

  @GET("/history-keyword/latest-keywords")
  Future<HttpResponse<HistoryKeywordResponse>> getHistoryKeywordList(
      @Header(tokenName) String token);
}
