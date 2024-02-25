import 'package:Lopy/src/domain/models/requests/page_request.dart';

class OrderItemListRequest {
  // custom-class type attribute must implement its `toMap` method for serialization purpose
  final PageRequest searchPage;

  OrderItemListRequest({required this.searchPage});

  Map<String, dynamic> toMap() {
    return {"searchPage": searchPage.toMap()};
  }
}
