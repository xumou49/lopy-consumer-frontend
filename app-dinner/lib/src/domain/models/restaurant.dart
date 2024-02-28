import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'restaurantTable')
class Restaurant extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String? address;
  final String? labels;
  final String? operatingHours;
  final String? contactDetails;
  final String imageUrl;
  final String rating;

  const Restaurant({
    this.id,
    required this.name,
    this.address,
    this.labels,
    this.operatingHours,
    this.contactDetails,
    required this.imageUrl,
    required this.rating,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'labels': labels,
      'operatingHours': operatingHours,
      'contactDetails': contactDetails,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      labels: map['labels'] as String,
      operatingHours: map['operatingHours'] as String,
      contactDetails: map['contactDetails'] as String,
      imageUrl: map['imageUrl'] as String,
      rating: map['rating'] as String,
    );
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      labels: json['labels'],
      address: json['address'],
      name: json['name'],
      operatingHours: json['operatingHours'],
      contactDetails: json['contactDetails'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }
}
