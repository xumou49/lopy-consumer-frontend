import 'package:equatable/equatable.dart';

class Cuisine extends Equatable {
  final num? id;
  final String? name;
  final String? imagePath;

  const Cuisine({this.id, this.name, this.imagePath});

  @override
  List<Object?> get props => [id, name];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory Cuisine.fromMap(Map<String, dynamic> map) {
    return Cuisine(
      id: map['id'] as num,
      name: map['name'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  factory Cuisine.fromJson(Map<String, dynamic> json) {
    return Cuisine(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
    );
  }
}
