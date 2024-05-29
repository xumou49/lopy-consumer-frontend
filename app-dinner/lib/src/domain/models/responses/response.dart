// response

import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
  final String msg;
  final int code;

  const BaseResponse({
    required this.msg,
    required this.code,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      msg: (map['msg'] ?? '') as String,
      code: (map['code'] ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [msg, code];
}
