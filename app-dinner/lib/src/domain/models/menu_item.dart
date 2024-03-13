import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'MenuItemTable')
class MenuItem extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? restaurantId;
  final int menuId;
  final String itemName;
  final String description;
  final double price;
  final String imageUrl;

  const MenuItem(
      {this.id,
      this.restaurantId,
      required this.menuId,
      required this.itemName,
      required this.description,
      required this.price,
      required this.imageUrl});

  @override
  List<Object?> get props =>
      [id, restaurantId, menuId, itemName, description, price, imageUrl];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'menuId': menuId,
      'itemName': itemName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['id'] as int,
      restaurantId: map['restaurantId'] as int,
      menuId: map['menuId'] as int,
      itemName: map['itemName'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      restaurantId: json['restaurantId'],
      menuId: json['menuId'],
      itemName: json['itemName'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
