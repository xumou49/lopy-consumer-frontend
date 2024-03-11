import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'cartTable')
class Cart extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? itemId;
  final String name;
  final int quantity;
  final double price;
  final int userId;
  final int restaurantId;
  final int restaurantMenuItemId;


  const Cart({
    this.itemId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.userId,
    required this.restaurantId,
    required this.restaurantMenuItemId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    itemId, name,
    quantity, price,
    userId, restaurantId,
    restaurantMenuItemId
  ];

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': itemId,
  //     'name': name,
  //     'quantity': quantity,
  //     'price': price
  //   };
  // }
  //
  // factory Cart.fromMap(Map<String, dynamic> map) {
  //   return Cart(
  //     itemId: map['itemId'] as int,
  //     name: map['name'] as String,
  //     quantity: map['quantity'] as int,
  //     price: map['quantity'] as double,
  //   );
  // }
  //
  // factory Cart.fromJson(Map<String, dynamic> json) {
  //   return Cart(
  //       itemId: json['itemId'],
  //       name: json['name'],
  //       quantity: json['quantity'],
  //       price: json['price']
  //   );
  // }
}