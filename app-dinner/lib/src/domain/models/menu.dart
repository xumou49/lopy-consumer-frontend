import 'package:Lopy/src/domain/models/menu_item.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'MenuTable')
class Menu extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? restaurantId;
  final int categoryId;
  final String menuName;
  final int status;
  final List<MenuItem> menuItemList;

  const Menu(
      {this.id,
      this.restaurantId,
      required this.categoryId,
      required this.menuName,
      required this.status,
      required this.menuItemList});

  @override
  List<Object?> get props =>
      [id, restaurantId, categoryId, menuName, status, menuItemList];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'categoryId': categoryId,
      'menuName': menuName,
      'status': status,
      'menuItemList': menuItemList,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] as int,
      restaurantId: map['restaurantId'] as int,
      categoryId: map['categoryId'] as int,
      menuName: map['menuName'] as String,
      status: map['status'] as int,
      menuItemList: map['menuItemList'] as List<MenuItem>,
    );
  }

  factory Menu.fromJson(Map<String, dynamic> json) {
    var list = json['menuItemList'] as List;
    List<MenuItem> menuItemList =
        list.map((i) => MenuItem.fromJson(i)).toList();

    return Menu(
      id: json['id'],
      restaurantId: json['restaurantId'],
      categoryId: json['categoryId'],
      menuName: json['menuName'],
      status: json['status'],
      menuItemList: menuItemList,
    );
  }
}
