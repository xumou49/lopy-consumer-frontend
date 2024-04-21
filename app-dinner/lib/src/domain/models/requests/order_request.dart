import 'package:Lopy/src/domain/models/cart.dart';
import 'package:Lopy/src/domain/models/requests/page_request.dart';

class OrderListRequest {
  // custom-class type attribute must implement its `toMap` method for serialization purpose
  final PageRequest searchPage;

  OrderListRequest({required this.searchPage});

  Map<String, dynamic> toMap() {
    return {"searchPage": searchPage.toMap()};
  }
}

class OrderPlaceRequest {
  final num restaurantId;
  final List<Cart> itemList;

  OrderPlaceRequest({required this.restaurantId, required this.itemList});

  Map<String, dynamic> toMap() {
    return {"restaurantId": restaurantId, "itemList": itemList};
  }
}
