import 'package:equatable/equatable.dart';

class HistorySearch extends Equatable {
  final num? id;
  final String? name;

  const HistorySearch({this.id, this.name});

  @override
  List<Object?> get props => [id, name];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory HistorySearch.fromMap(Map<String, dynamic> map) {
    return HistorySearch(
      id: map['id'] as num,
      name: map['name'] as String,
    );
  }

  factory HistorySearch.fromJson(Map<String, dynamic> json) {
    return HistorySearch(
      id: json['id'],
      name: json['name'],
    );
  }
}
