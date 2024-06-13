import 'package:equatable/equatable.dart';

class HistoryKeywordResponse extends Equatable {
  final String msg;
  final int code;
  final List<String> historyKeywords;

  const HistoryKeywordResponse({
    required this.msg,
    required this.code,
    required this.historyKeywords,
  });

  Map<String, dynamic> toMap() {
    return {
      'historyKeywords': historyKeywords,
    };
  }

  factory HistoryKeywordResponse.fromMap(Map<String, dynamic> map) {
    return HistoryKeywordResponse(
      historyKeywords:
          List<String>.from(map['data'].map<dynamic>((x) => x.toString())),
      msg: (map['msg'] ?? '') as String,
      code: (map['code'] ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [historyKeywords];
}
