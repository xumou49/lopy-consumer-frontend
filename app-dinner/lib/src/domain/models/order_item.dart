import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'orderItemTable')
class OrderItem extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final num? id;
  final String? itemName;
  final int? quantity;
  final double? itemPrice;

  const OrderItem({this.id, this.itemName, this.quantity, this.itemPrice});

  @override
  List<Object?> get props => [id, itemName, quantity, itemPrice];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'quantity': quantity,
      'itemPrice': itemPrice,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'] as num,
      itemName: map['itemName'] as String,
      quantity: map['quantity'] as int,
      itemPrice: map['itemPrice'] as double,
    );
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      itemName: json['itemName'],
      quantity: json['quantity'],
      itemPrice: json['itemPrice'],
    );
  }
}
