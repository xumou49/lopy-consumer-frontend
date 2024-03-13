import 'dart:convert';

import 'package:Lopy/src/domain/models/menu.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'MenuCategoryTable')
class MenuCategory extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int? restaurantId;
  final String categoryName;
  final int status;
  final List<Menu> menuList;

  const MenuCategory(
      {this.id,
      this.restaurantId,
      required this.categoryName,
      required this.status,
      required this.menuList});

  @override
  List<Object?> get props => [id, restaurantId, categoryName, status, menuList];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'categoryName': categoryName,
      'status': status,
      'menuList': menuList
    };
  }

  factory MenuCategory.fromMap(Map<String, dynamic> map) {
    return MenuCategory(
        id: map['id'] as int,
        restaurantId: map['restaurantId'] as int,
        categoryName: map['categoryName'] as String,
        status: map['status'] as int,
        menuList: jsonDecode(map['menuList']) as List<Menu>);
  }

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    var list = json['menuList'] as List;
    List<Menu> menuList = list.map((i) => Menu.fromJson(i)).toList();

    return MenuCategory(
      id: json['id'],
      restaurantId: json['restaurantId'],
      categoryName: json['categoryName'],
      status: json['status'],
      menuList: menuList,
    );
  }
}
