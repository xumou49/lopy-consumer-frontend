import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'orderTable')
class Order extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final num? id;
  final String? uid;
  final String? restaurantName;
  final num? restaurantId;
  final int? status;
  final double? totalCost;
  final double? taxes;
  final double? discounts;
  final String? completeDate;

  const Order(
      {this.id,
      this.uid,
      this.restaurantName,
      this.restaurantId,
      this.status,
      this.totalCost,
      this.taxes,
      this.discounts,
      this.completeDate});

  @override
  List<Object?> get props => [id, restaurantId, status];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'restaurantName': restaurantName,
      'restaurantId': restaurantId,
      'status': status,
      "totalCost": totalCost,
      'taxes': taxes,
      'discounts': discounts,
      'completeDate': completeDate,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as num,
      uid: map['uid'] as String,
      restaurantName: map['restaurantName'] as String,
      restaurantId: map['restaurantId'] as num,
      status: map['status'] as int,
      totalCost: map['totalCost'] as double,
      taxes: map['taxes'] as double,
      discounts: map['discounts'] as double,
      completeDate: map['completeDate'] as String,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      uid: json['uid'],
      restaurantName: json['restaurantName'],
      restaurantId: json['restaurantId'],
      status: json['status'],
      totalCost: json['totalCost'],
      taxes: json['taxes'],
      discounts: json['discounts'],
      completeDate: json['completeDate'],
    );
  }
}
