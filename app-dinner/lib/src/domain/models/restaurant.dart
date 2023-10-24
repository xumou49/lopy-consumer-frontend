import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'restaurantTable')
class Restaurant extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? name;
  final String? address;
  final String? cuisine;
  final double? rating;

  const Restaurant({
    this.id,
    this.name,
    this.address,
    this.cuisine,
    this.rating,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'cuisine': cuisine,
      'rating': rating,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      cuisine: map['cuisine'] as String,
      rating: map['rating'] as double,
    );
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      cuisine: json['cuisine'],
      address: json['location'],
      name: json['name'],
      rating: json['rating'].toDouble(),
    );
  }
}