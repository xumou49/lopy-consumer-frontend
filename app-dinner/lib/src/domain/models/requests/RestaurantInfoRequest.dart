import 'dart:ffi';

class RestaurantInfoRequest {
  final int id;

  RestaurantInfoRequest({this.id = 0});

  Map<String, dynamic> toMap() {
    return {"id": id, };
  }
}
