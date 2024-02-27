import 'package:equatable/equatable.dart';
import '../restaurant.dart';

class RestaurantInfoResponse extends Equatable {
  final Restaurant restaurant;

  const RestaurantInfoResponse({
    required this.restaurant,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': restaurant,
    };
  }

  factory RestaurantInfoResponse.fromMap(Map<String, dynamic> map) {
    return RestaurantInfoResponse(restaurant: Restaurant.fromJson(map["data"] as Map<String, dynamic>));
  }

  @override
  List<Object> get props => [restaurant];
}
