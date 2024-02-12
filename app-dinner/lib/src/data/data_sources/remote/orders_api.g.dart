// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _OrdersApi implements OrdersApi {
  _OrdersApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://127.0.0.1:8080/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<OrderResponse>> getOrderList(orderListRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(orderListRequest?.toMap() ?? <String, dynamic>{});
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<OrderResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/order/list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderResponse.fromMap(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<OrderResponse>> getOrderPage(orderListRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(orderListRequest?.toMap() ?? <String, dynamic>{});
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<OrderResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/order/page',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderResponse.fromMap(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
